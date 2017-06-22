FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password { SecureRandom.hex }
    confirmed_at { Date.today - 2.days }
  end
end
