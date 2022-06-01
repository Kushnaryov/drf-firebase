# drf-firebase
Minimalistic Django REST framework template with token authentication method through firebase

## Usage

This app does not contain any roots, except one /hello.
You can access it from any frontend app. 

Token will be validated, and if a user is logged in with firebase you will get dummy data.
### Run template on the local machine

To run it on local machine you should provide auth configs from your firebase app. Watch here: https://support.google.com/firebase/answer/7015592?hl=en#zippy=%2Cin-this-article

Add to environment variables values from firebase auth config:

FIREBASE_PROJECT_ID= <"project_id">
FIREBASE_PRIVATE_KEY_ID= <"private_key_id">
FIREBASE_PRIVATE_KEY= <"private_key">
FIREBASE_CLIENT_EMAIL= <"client_email">
FIREBASE_CLIENT_ID= <"client_id">
FIREBASE_CLIENT_CERT_URL= <"client_x509_cert_url">

run:    python manage.py makemigrations
        python manage.py migrate
        python manage.py createsuperuser
        ...
        python manage.py runserver

visit localhost:8000
### Run template via docker:

Create .env file in your root directory:

Fill it up with template:

DJANGO_DB_NAME=<"your_db_name">
DJANGO_SU_NAME=<"your_superusername_name">
DJANGO_SU_EMAIL=<"your_superuser_email">
DJANGO_SU_PASSWORD=<"your_superuser_password">

FIREBASE_PROJECT_ID= <"project_id">
FIREBASE_PRIVATE_KEY_ID= <"private_key_id">
FIREBASE_PRIVATE_KEY= <"private_key">
FIREBASE_CLIENT_EMAIL= <"client_email">
FIREBASE_CLIENT_ID= <"client_id">
FIREBASE_CLIENT_CERT_URL= <"client_x509_cert_url">


run: docker pull mkush/drf_firabase:v1.0
run: docker run --env-file .env -p 1234:8000 mkush/drf_firebase:v1.0

visit localhost:1234


