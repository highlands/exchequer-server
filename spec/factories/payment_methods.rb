FactoryGirl.define do
  factory :payment_method do
    user
    token Faker::Crypto.sha1
    card_type 'visa'
    last_four_digits '1234'
  end
end
