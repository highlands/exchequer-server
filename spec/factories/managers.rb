FactoryGirl.define do
  factory :manager do
    name { Faker::Company.name }
    public_token { Faker::Crypto.sha1 }
  end
end
