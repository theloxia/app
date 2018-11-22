# Pull base image
FROM python:3.7.1

# Set environment varibles
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set work directory
WORKDIR /code

# Install dependencies
RUN pip install --upgrade pip
RUN pip install --upgrade pipenv
ADD ./Pipfile /code/Pipfile
RUN pipenv install --deploy --system --skip-lock --dev
RUN pipenv install -r requirements.txt

# Copy project
ADD . /code/