#!/bin/bash
set -e

if [ "$1" = "sidekiq" ]; then
  bundle exec sidekiq
else

  if [ -f tmp/pids/server.pid ]; then
    rm tmp/pids/server.pid
  fi

  if [ -f tmp/pids/server_test.pid ]; then
    rm tmp/pids/server_test.pid
  fi

  bundle exec rake db:migrate 2>/dev/null || bundle exec rake db:setup

  exec "$@"
fi