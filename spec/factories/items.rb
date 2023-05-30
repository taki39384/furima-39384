FactoryBot.define do
  factory :item do
    name { Faker::Commerce.product_name }
    category_id { 2 }
    explanation { Faker::Lorem.paragraph }
    situation_id { 2 }
    delivery_charge_id { 2 }
    region_of_origin_id { 2 }
    day_to_ship_id { 2 }
    price { Faker::Number.between(from: 300, to: 9999999) }
    association :user
    after(:build) do |item|
      item.itemimage.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
