FactoryBot.define do
  factory :item do
    name { Faker::Lorem.sentence }
    description { Faker::Lorem.sentence }
    price { 1000 }
    category_id { 1 }
    condition_id { 1 }
    burden_id { 1 }
    prefecture_id { 1 }
    scheduled_day_id { 1 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/test_image.png'), filename: 'test_image.png')
    end
  end
end
