@echo off

REM Check if requirements.txt exists
if exist "C:\opt\airflow\requirements.txt" (
    python -m pip install --upgrade pip
    pip install --user -r C:\opt\airflow\requirements.txt
)

REM Check if airflow.db does not exist
if not exist "C:\opt\airflow\airflow.db" (
    airflow db init
    airflow users create
    --username admin
    --firstname admin
    --lastname admin
    --role Admin
    --email admin@example.com
    --password admin
)

airflow db upgrade

start "" airflow webserver
