module CommonSteps
  module Login
    include LoginHelper
    include Spinach::DSL

    EMAIL = 'user@example.com'.freeze
    PASSWORD = 'password'.freeze

    step 'I am logged in' do
      log_in_as(EMAIL, PASSWORD)
    end
  end
end
