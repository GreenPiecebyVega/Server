#!/bin/bash
set -e

if [ "$1" = "sidekiq" ]; then
  bundle exec sidekiq
else

  if [ -f tmp/pids/server.pid ]; then
    rm -f tmp/pids/server.pid
  fi

  if [ -f tmp/pids/server_test.pid ]; then
    rm -f tmp/pids/server_test.pid
  fi

  if [ "$1" = "server" ]; then
    bundle exec rake db:migrate 2>/dev/null || bundle exec rake db:setup
    rails db:seed  
  fi
  
  exec "$@"
fi