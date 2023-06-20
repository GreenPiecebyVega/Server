#!/bin/bash
set -e

if [ "$1" == "bundle" ] && [[ ! "$*" == *"sidekiq"* ]]; then
  
  if [ -f tmp/pids/server.pid ]; then
    rm tmp/pids/server.pid
  elif [ -f tmp/pids/server_test.pid ]; then
    rm tmp/pids/server_test.pid
  fi
  
  bundle exec rake db:create 2>/dev/null
  bundle exec rake db:migrate 2>/dev/null
  bundle exec rake db:seed
  exec "$@"
else
  exec "$@"
fi