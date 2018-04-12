#!/bin/bash
echo -e " \033[1m\033[32mEnter Project Name Except['test','abc']"
read project_name

mkdir $project_name
cd $project_name
mkdir Dev
cd Dev
mkdir $project_name
echo -e "\033[1m\033[36mCreating virtual Envirenment python 3"
virtualenv -p python3 env
source env/bin/activate

cd $project_name
mkdir config
mkdir src
echo -e "\033[1m\033[32mCreate Docker/docker-compose/jenkins File"
touch Dockerfile
touch Jenkinsfile
touch docker-compose.yml
echo -e "\033[1m\033[32mInstall Package"
echo -e "
\033[1m  Basic 	 			Standard				Advance
\033[0m\033[36m1) Django 	 			1) Django		
\033[0m\033[36m1) Rest Framework
			

	"
echo -e "\033[1m\033[33m 1 => Basic(Empty \n 2 => Standard \n 3 => Advance"
read option

echo "============================Django===================================="
if [ $option="1" ]
then
echo -e "\033[4m\033[1m\033[32m Installation Django in your Env.."
pip install django

cd src
echo -e "\033[4m\033[1m\033[34m Create Project"
django-admin startproject $project_name .

cd $project_name
mkdir settings
echo "==================Create Base Setting for This Projects================"
cp settings.py settings/base.py 
echo "Change setting for run this project BASE DIR"
sed -i 's/(os.path.abspath(__file__)))/(os.path.dirname(os.path.abspath(__file__))))/g' settings/base.py

echo "Rename settings.py to old_setting.py"
mv settings.py old_settings.py 

echo "Create Prod and Dev"
touch settings/__init__.py settings/prod.py settings/dev.py

echo "connection string dev.py Dev_db "
echo "
from .base import *
DEBUG = True
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.sqlite3',
        'NAME': 'db.Dev_db',
        'USER': '',
    }
}

# $ ./manage.py runserver --settings=myproject.settings.dev
# $ ./manage.py runserver --settings=myproject.settings.prod
" > settings/dev.py

echo "connection string Prod.py PostgresDB"
echo "
from .base import *
DEBUG = False
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'myproject',
        'USER': 'myuser',
        'PASSWORD': 'bestpasswordever',
    }
}
# $ ./manage.py runserver --settings=myproject.settings.dev
# $ ./manage.py runserver --settings=myproject.settings.prod

" > settings/prod.py

echo "content of __init__"
echo "
from .base import *

try:
    from .base import *
except:
    pass" > settings/__init__.py

echo "Back To parent Dir"
cd ..

echo -e "\033[4m\033[1m\033[32m Server is Started..."
python manage.py makemigrations 
python manage.py migrate
python manage.py runserver 

fi


