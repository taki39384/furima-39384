FactoryBot.define do
  factory :order_information do
    post_code { '123-4567' }
    region_of_origin_id { 2 }
    municipalities { '東京都' }
    address { '1-1' }
    building_name { '東京ハイツ' }
    number { '09012345678' }
    token {"tok_abcdefghijk00000000000000000"}
    association :user_id
    association :item_id
  end
end
