source 'https://rubygems.org'
ruby '~> 2.5.0'
git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'highlands_auth', git: 'git@github.com:highlands/highlands_auth.git', branch: 'master'

# Paranoia
gem 'paranoia', '~> 2.4.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.4'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.18'
# Active Admin
gem 'activeadmin', '~> 1.1.0'
# Searchable Select - Autocomplete for ActiveAdmin
gem 'activeadmin-searchable_select', '~>1.0.0'
# Active Model Serializers used for the API layer
gem 'active_model_serializers', '~> 0.10.6'
# Cancan for authorization
gem 'cancan', '~> 1.6.10'
# Use Puma as the app server
gem 'puma', '~> 3.7'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby
# Enable HAML for views
gem 'haml-rails', '~> 1.0'

# Spreedly
gem 'spreedly', '~> 2.0.17'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7.0'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'

gem 'rack-cors', require: 'rack/cors'

## Asset bits
gem 'font-awesome-rails', '~> 4.7.0'
gem 'purecss-sass', '~> 0.6.2'

## Documentation
gem 'apitome', '~>0.1.0'

# Capistrano and deployment
gem 'passenger'
gem 'capistrano', '~> 3.10.1'
gem 'capistrano-bundler', '~> 1.3'
gem 'capistrano-rails'
gem 'capistrano-rvm'
gem 'capistrano-passenger'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  gem 'capybara-selenium', '~> 0.0.6'
  gem 'chromedriver-helper', '~> 1.1.0'
  gem 'database_cleaner', '~> 1.6.1'
  gem 'factory_girl_rails', '~> 4.8.0'
  gem 'faker', '~> 1.8.4'
  gem 'launchy', '~> 2.4.3'
  gem 'poltergeist', '~> 1.16.0'
  gem 'rails-controller-testing', '~> 1.0.2'
  gem 'rspec-rails', '~> 3.7.1'
  gem 'rspec_api_documentation', '~> 5.1.0'
  gem 'rubocop', '~> 0.51.0'
  gem 'selenium-webdriver', '~> 3.6.0'
  gem 'shoulda-matchers', '~> 3.1.2'
  gem 'simplecov', '~> 0.15.1', require: false
  gem 'simplecov-json', require: false
  gem 'spinach-rails', '~> 0.2.1'
  gem 'vcr', '~>4.0.0'
  gem 'webmock', '~> 3.1.0'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring', '~> 2.0.2'
  gem 'spring-watcher-listen', '~> 2.0.0'
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
