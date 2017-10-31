FactoryGirl.define do
  factory :api_key do
    auth_token 'password'
    app
  end
end
