#!/bin/bash
set -e

if [ -f tmp/pids/server.pid ]; then
  rm tmp/pids/server.pid
fi

# Gems updated without need to run bundle on development
bundle check && bundle install

# new migrations
rails db:migrate

bundle exec rails s -p 3000 -b '0.0.0.0'