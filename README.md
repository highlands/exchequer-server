[![Build Status](https://semaphoreci.com/api/v1/projects/6206d25c-dbd3-43f8-9aeb-a2652ab8e7c9/1590710/badge.svg)](https://semaphoreci.com/dailydrip/exchequer-server)

# Exchequer Server

Exchequer is a unified transaction processing platform for
[Church of the Highlands](https://www.churchofthehighlands.com/). It is written
in [Ruby on Rails](http://rubyonrails.org/) and backed by
[Postgres](https://www.postgresql.org/).

### Setup

* $ first set RAILS_MASTER_KEY in your environment
* $ bundle install --deployment --path vendor/bundle
* $ bundle exec rake db:setup
* $ bundle exec rake db:test:prepare


#### Environment Variables

To run this project, you'll need a handful of environment variables for the Highlands Auth gem.

```sh
SSO_KEY=""
SSO_SECRET=""
HIGHLANDS_AUTH_REDIRECT=""
HIGHLANDS_AUTH_SUPPORT_EMAIL=""
HIGHLANDS_SSO_EMAIL=""
HIGHLANDS_SSO_PASSWORD=""
```

Internally to this project we solely use [Rails 5.1 Encrypted Secrets.](https://www.engineyard.com/blog/encrypted-rails-secrets-on-rails-5.1).

### Tests

We use Rubocop for Ruby linting, stylelint for CSS linting, rspec for unit tests, and spinach for
integration tests. You can run all four simply by running `rake` or indivdually with the following
commands:

* $ bundle exec rubocop
* $ bundle exec stylelint
* $ bundle exec rspec
* $ bundle exec spinach

### Documentation

We are using
[rspec_api_documentation](https://github.com/zipmark/rspec_api_documentation) to
test our API. To generate the docs, you can:

```sh
rake docs:generate
```
And it will be saved in: `doc/api/index.{html,json}`.

We are using [apitome](https://github.com/jejacks0n/apitome) to visualize our docs.
