# base image  
FROM python:3.10 
# setup environment variable  
ENV APP_HOME=/usr/src/app

# set work directory  
RUN mkdir -p $APP_HOME
# RUN mkdir $APP_HOME/static
WORKDIR $APP_HOME
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# dependencies
RUN pip install --upgrade pip


COPY . $APP_HOME
RUN pip install -r requirements.txt

RUN chmod 755 entrypoint.sh

ENTRYPOINT [ "/usr/src/app/entrypoint.sh" ]
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]