#!/bin/bash
set -e

if [ "$1" = "sidekiq" ]; then
  bundle exec sidekiq
else
  rm -f tmp/pids/server.pid
  exec "$@"
fi