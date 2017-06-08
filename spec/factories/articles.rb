FactoryGirl.define do 
  factory :article do
    title { Faker::Book.title }
    body { Faker::Lorem.paragraph }
  end
end
