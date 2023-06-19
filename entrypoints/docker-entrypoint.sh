#!/bin/bash
set -e

if [ "$1" == "bundle" ] && [[ ! "$*" == *"sidekiq"* ]]; then
  bundle exec rake db:create 2>/dev/null
  bundle exec rake db:migrate 2>/dev/null
  bundle exec rake db:seed
  exec "$@"
else
  exec "$@"
fi