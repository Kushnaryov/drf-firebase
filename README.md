# drf-firebase
Minimalistic Django REST framework template with token authentication method through firebase

## Usage

This app does not contain any roots, except one /hello.
You can access it from any frontend app. 

Token will be validated, and if a user is logged in with firebase you will get dummy data.
### Run template on the local machine

To run it on local machine you should provide auth configs from your firebase app. Watch here: https://support.google.com/firebase/answer/7015592?hl=en#zippy=%2Cin-this-article

Clone repository <br />

Add to environment variables values from firebase auth config: <br />

FIREBASE_PROJECT_ID= <"project_id"> <br />
FIREBASE_PRIVATE_KEY_ID= <"private_key_id"> <br />
FIREBASE_PRIVATE_KEY= <"private_key"> <br />
FIREBASE_CLIENT_EMAIL= <"client_email"> <br />
FIREBASE_CLIENT_ID= <"client_id"> <br />
FIREBASE_CLIENT_CERT_URL= <"client_x509_cert_url"> <br />

then run: <br />
pip install -r requerements.txt (inside virtualenv) <br />
python manage.py makemigrations <br />
python manage.py migrate <br />
python manage.py createsuperuser <br />
... <br />
python manage.py runserver <br />

visit localhost:8000
### Run template via docker:

Create .env file in your root directory: <br />

Fill it up with template: <br />

DJANGO_DB_NAME=<"your_db_name"> <br />
DJANGO_SU_NAME=<"your_superusername_name"> <br />
DJANGO_SU_EMAIL=<"your_superuser_email"> <br />
DJANGO_SU_PASSWORD=<"your_superuser_password"> <br />

FIREBASE_PROJECT_ID= <"project_id"> <br />
FIREBASE_PRIVATE_KEY_ID= <"private_key_id"> <br />
FIREBASE_PRIVATE_KEY= <"private_key"> <br />
FIREBASE_CLIENT_EMAIL= <"client_email"> <br />
FIREBASE_CLIENT_ID= <"client_id"> <br />
FIREBASE_CLIENT_CERT_URL= <"client_x509_cert_url"> <br />


run: docker pull mkush/drf_firabase:v1.0 <br />
run: docker run --env-file .env -p 1234:8000 mkush/drf_firebase:v1.0 <br />

visit localhost:1234





