FROM ruby:2.5-alpine3.7

RUN apk update && \
    apk --no-cache add mysql-client


# ソースコードフォルダ
RUN mkdir -p /var/www/app
WORKDIR /var/www/app

# ソースコードコピー
COPY src /var/www/app
COPY ./startup.sh /var/www
RUN chmod +x /var/www/startup.sh

EXPOSE 3000
