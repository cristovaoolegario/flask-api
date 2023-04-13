#!/bin/sh

echo "###### Running Database migrations ######"
flask db upgrade

echo "###### Starting app ######"
exec gunicorn --bind 0.0.0.0:80 "app:create_app()"