# Pull official base image 
FROM python:3.8-slim

# Set working directory
WORKDIR /app

# Set env variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN apt-get update -y \
    && apt-get install -y gcc python3-dev musl-dev libmagic1 libffi-dev \
    && apt-get install -y wkhtmltopdf \
    && pip install Pillow


COPY ./requirements.txt ./requirements.txt

# Install dependencies
RUN pip install --upgrade pip
RUN pip install -r ./requirements.txt

# Copy entrypoint.sh
COPY ./entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh


ENTRYPOINT [ "/entrypoint.sh" ]






