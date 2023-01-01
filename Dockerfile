###########
# BUILDER #
###########

FROM python:3.10-alpine3.16

# set maintaner
LABEL maintainer="dayopraisegod@gmail.com"

# set environment variables
ENV PYTHONUNBUFFERED 1

#set working directory
WORKDIR /app

# copy requirements file and the project to working directory
COPY ./requirements.txt /tmp/requirements.txt
COPY ./app /app

# expose port to host
EXPOSE 8000

# install the requirements for the project
RUN python -m venv /py && \
    /py/bin/pip install --upgrade pip && \
    /py/bin/pip install -r /tmp/requirements.txt && \
    rm -rf /tmp && \
    adduser \
        --disabled-password \
        --no-create-home \
        django-user

# add virtual environment to path
ENV PATH="/py/bin:$PATH"

# set user to the created user
USER django-user
