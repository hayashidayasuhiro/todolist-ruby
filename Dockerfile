FROM ruby:2.5-alpine3.7

# ソースコードフォルダ
RUN mkdir -p /var/www/app
WORKDIR /var/www/app

## Gemfile
#ADD ./src/Gemfile /var/www/app/Gemfile
#ADD ./src/Gemfile.lock /var/www/app/Gemfile.lock

RUN apk update && \
    apk --no-cache add mysql-client nodejs tzdata && \
    apk --no-cache add \
        build-base \
        libxml2-dev \
        libxslt-dev \
        mysql-dev
#    apk --no-cache add mysql-client mysql-dev nodejs tzdata && \
#    apk --no-cache add --virtual build-dependencies \
#        build-base \
#        libxml2-dev \
#        libxslt-dev \
#        mysql-dev && \
#    bundle config --global build.nokogiri --use-system-libraries && \
#    bundle install -j4 && \
#    apk del build-dependencies

# ソースコードコピー
COPY src /var/www/app
COPY ./startup.sh /var/www
RUN chmod +x /var/www/startup.sh

EXPOSE 3000
