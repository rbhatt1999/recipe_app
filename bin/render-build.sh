#!/usr/bin/env bash
# exit on error
set -o errexit
bundle lock --add-platform x86_64-linux
bundle install
bundle exec rake assets:precompile
bundle exec rake assets:clean
bundle exec rake db:migrate
