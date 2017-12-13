ENV['RAILS_ENV'] = 'test'
require 'simplecov'
require './config/environment'
require 'rspec/rails'
require 'spinach/capybara'
require 'spinach/frameworks/rspec'
require 'webmock'
require 'database_cleaner'
require 'capybara/poltergeist'
require 'selenium/webdriver'

# Database Cleaner Config
DatabaseCleaner.strategy = :truncation
Spinach.hooks.before_scenario { DatabaseCleaner.clean }

Spinach.config.save_and_open_page_on_failure = true

Capybara.asset_host = 'http://localhost:3000'

WebMock.disable_net_connect!(allow_localhost: true)

Spinach.hooks.before_scenario do
  DatabaseCleaner.clean
end

Capybara.asset_host = 'http://localhost:3000'

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end

Capybara.register_driver :headless_chrome do |app|
  capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(
    chromeOptions: { args: %w[headless disable-gpu] }
  )

  Capybara::Selenium::Driver.new app,
    browser: :chrome,
    desired_capabilities: capabilities
end

Spinach.hooks.on_tag('javascript') do
  ::Capybara.current_driver = :headless_chrome
  Capybara.current_session.current_window.resize_to(1920, 1080)
end
