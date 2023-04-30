#!/bin/bash
set -e

if [ -f tmp/pids/server.pid ]; then
  rm tmp/pids/server.pid
fi

bundle exec rake db:migrate 2>/dev/null || bundle check

bundle exec rails s -p 3000 -b '0.0.0.0'