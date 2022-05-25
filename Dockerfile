FROM yiisoftware/yii2-php:7.4-apache

WORKDIR /app
COPY . /app/Web

RUN apt-get -y update
RUN apt-get install -y pv
RUN docker-php-ext-install mysqli && docker-php-ext-enable mysqli
RUN apt-get -y install cron
RUN apt-get -y install nano


COPY root /var/spool/cron/crontabs/

EXPOSE 80