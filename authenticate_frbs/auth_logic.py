from django.contrib.auth.models import User
from django.utils import timezone

import firebase_admin
from firebase_admin import auth, credentials
from rest_framework import authentication, exceptions
import os

cred = credentials.Certificate({
    "type": "service_account",
    "project_id": os.environ.get('FIREBASE_PROJECT_ID'),
    "private_key_id": os.environ.get('FIREBASE_PRIVATE_KEY_ID'),
    "private_key": os.environ.get('FIREBASE_PRIVATE_KEY').replace('\\n', '\n'),
    "client_email": os.environ.get('FIREBASE_CLIENT_EMAIL'),
    "client_id": os.environ.get('FIREBASE_CLIENT_ID'),
    "auth_uri": "https://accounts.google.com/o/oauth2/auth",
    "token_uri": "https://oauth2.googleapis.com/token",
    "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
    "client_x509_cert_url": os.environ.get('FIREBASE_CLIENT_CERT_URL')
})
firebase_admin.initialize_app(cred)

class FirebaseAuthentication(authentication.BaseAuthentication):

    def authenticate(self, request):

        auth_header = request.META.get("HTTP_AUTHORIZATION")
        print(auth_header)
        if not auth_header:
            raise exceptions.AuthenticationFailed('Auth token not provided')

        id_token = auth_header.split(" ")[1]
        decoded_token = None
        try:
            decoded_token = auth.verify_id_token(id_token)
        except Exception:
            raise exceptions.AuthenticationFailed('Invalid auth token')

        if not id_token or not decoded_token:
            return None
        try:
            uid = decoded_token.get('uid')
        except Exception:
            raise exceptions.AuthenticationFailed('No such user exists')

        user, _ = User.objects.get_or_create(username=uid)
        return (user, None)