FactoryBot.define do
  factory :card do
    title { Faker::Lorem.word }
    description { Faker::Lorem.sentence }
    section { Faker::Lorem.word }
    url { Faker::Lorem.word }
    image_url { Faker::Lorem.word }
    tags { Faker::Lorem.word }
  end
end

