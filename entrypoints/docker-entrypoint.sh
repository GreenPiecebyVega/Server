#!/bin/bash
set -e

if [ -f tmp/pids/server.pid ]; then
  rm tmp/pids/server.pid
fi

bundle install --path vendor/bundle
bundle exec rails s -p 3000 -b '0.0.0.0'