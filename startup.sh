#!/bin/sh

set -e
host="$1"
shift
user="$1"
shift
password="$1"

echo "Waiting for mysql"
until mysql -h "$host" -u "$user" -p"$password" -e "exit" &> /dev/null
do
    echo "mysql is unavailable - sleeping"
    sleep 1
done

echo "mysql is up - executing command"

if [ -e tmp/pids/server.pid ]; then
    rm tmp/pids/server.pid
fi

# nokogiriのインストールエラーを回避
bundle config --global build.nokogiri --use-system-libraries
bundle install -j4 --path=vendor/bundle
bundle exec rake db:migrate
bundle exec rails s -b 0.0.0.0
