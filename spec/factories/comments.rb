FactoryGirl.define do
  factory :comment do
    commenter { Faker::Internet.user_name }
    body      { Faker::Lorem.sentence }
    article nil
  end
end
