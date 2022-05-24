FROM postgres:14-bullseye

WORKDIR /usr/src/app

RUN apt-get update \
  && apt-get -y install python3 python3-venv python3-pip \
  && apt-get clean

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

COPY . .

RUN pip3 install --upgrade pip && pip3 install -r requirements.txt

CMD python3 app.py