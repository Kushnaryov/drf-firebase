#!/bin/bash
export FIREBASE_PROJECT_ID=$FIREBASE_PROJECT_ID
export FIREBASE_PRIVATE_KEY_ID=$FIREBASE_PRIVATE_KEY_ID
export FIREBASE_PRIVATE_KEY=$FIREBASE_PRIVATE_KEY
export FIREBASE_CLIENT_EMAIL=$FIREBASE_CLIENT_EMAIL
export FIREBASE_CLIENT_ID=$FIREBASE_CLIENT_ID
export FIREBASE_CLIENT_CERT_URL=$FIREBASE_CLIENT_CERT_URL

export DJANGO_SU_NAME=$DJANGO_SU_NAME
export DJANGO_DB_NAME=$DJANGO_DB_NAME
export DJANGO_SU_EMAIL=$DJANGO_SU_EMAIL
export DJANGO_SU_PASSWORD=$DJANGO_SU_PASSWORD
export DJANGO_SETTINGS_MODULE='firebaseauth.settings'

echo "createing migrations"
python3 manage.py makemigrations
echo "migrating"
python3 manage.py migrate
python manage.py collectstatic --no-input
echo "creating superuser"
python3 -c "import django; django.setup(); \
   from django.contrib.auth.management.commands.createsuperuser import get_user_model; \
   get_user_model()._default_manager.db_manager('$DJANGO_DB_NAME').create_superuser( \
   username='$DJANGO_SU_NAME', \
   email='$DJANGO_SU_EMAIL', \
   password='$DJANGO_SU_PASSWORD')"

exec "$@"