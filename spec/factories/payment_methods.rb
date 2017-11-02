FactoryGirl.define do
  factory :payment_method do
    user
    token 'MyString'
  end
end
