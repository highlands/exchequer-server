FactoryGirl.define do
  factory :payment_method do
    user
    token Faker::Crypto.sha1
  end
end
