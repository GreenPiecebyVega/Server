#!/bin/bash
set -e

if [ "$1" = "sidekiq" ]; then
  bundle exec sidekiq
else
  exec "$@"
fi