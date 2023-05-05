#!/bin/bash
set -e

if [ -f tmp/pids/server.pid ]; then
  rm tmp/pids/server.pid
fi

# update enviroment dependecies
bundle check || bundle install

# run migrations
rails db:migrate

# exec's the server
bundle exec rails s -p 3000 -b '0.0.0.0'