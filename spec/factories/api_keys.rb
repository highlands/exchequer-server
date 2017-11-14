FactoryGirl.define do
  factory :api_key do
    auth_token Faker::Crypto.sha1
    app
  end
end
