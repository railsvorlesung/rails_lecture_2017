FactoryGirl.define do
  factory :user_profile do
    firstname {Faker::Name.first_name }
    lastname  {Faker::Name.last_name }
    street    {Faker::Address.street_address }
    city      {Faker::Address.city }
    zipcode   {Faker::Address.zip_code }
    association :user, factory: :user
  end
end
