#!/bin/bash
echo -e " \033[1m\033[32mEnter Project Name"
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

if [ $option="1" ]
then
    echo -e "\033[4m\033[1m\033[32m Installation Django in your Env.."
    pip install django

    cd src
    echo -e "\033[4m\033[1m\033[34m Create Project"
    django-admin startproject $project_name .
    python manage.py makemigration 
    python manage.py migrate
    python manage.py runserver

fi


