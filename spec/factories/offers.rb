FactoryGirl.define do
  factory :offer do
    app
    description Faker::Lorem.sentence
    name Faker::Lorem.word
    due_on '2017-10-28 20:17:48'
    amount BigDecimal.new('100.00')
    deferrable false
  end
end
