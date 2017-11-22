FactoryGirl.define do
  factory :payment do
    invoice
    amount BigDecimal.new('10.00')
    transaction_token Faker::Crypto.sha1
  end
end
