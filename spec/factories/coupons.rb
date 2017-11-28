FactoryGirl.define do
  factory :coupon do
    offer
    name { Faker::Lorem.word }
    code { Faker::Lorem.word }
    percent_off BigDecimal.new('10.00')
    trait :amount do
      percent_off nil
      amount_off 10
    end
  end
end
