[![Build Status](https://semaphoreci.com/api/v1/projects/6206d25c-dbd3-43f8-9aeb-a2652ab8e7c9/1590710/badge.svg)](https://semaphoreci.com/dailydrip/exchequer-server)

# Exchequer Server

Exchequer is a unified transaction processing platform for
[Church of the Highlands](https://www.churchofthehighlands.com/). It is written
in [Ruby on Rails](http://rubyonrails.org/) and backed by
[Postgres](https://www.postgresql.org/).

### Setup

* $ bundle install --deployment --path vendor/bundle
* $ bundle exec rake db:setup
* $ bundle exec rake db:test:prepare

### Tests

We use Rubocop for linting, rspec for unit tests, and spinach for integration
tests. You can run all three simply by running `rake` or indivdually with the
following commands:

* $ bundle exec rubocop
* $ bundle exec rspec
* $ bundle exec spinach
