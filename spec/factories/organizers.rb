FactoryBot.define do
  factory :organizer do
    name { Faker::Name::name}
    email { Faker::Internet.email }
    password { "user1234" }
    phone_no { "1234567890" }
    address { " indore" }
  end
end

