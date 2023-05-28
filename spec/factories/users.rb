FactoryBot.define do
  factory :user do
    nickname { Faker::Internet.username }
    last_name { '齋藤' }
    first_name { '飛鳥' }
    last_name_kana { 'サイトウ' }
    first_name_kana { 'アスカ' }
    birth_day { Faker::Date.birthday(min_age: 18, max_age: 65) }
    email {Faker::Internet.free_email}
    password {'1a' + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
  end
end