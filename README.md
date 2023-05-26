# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | --------------------------|
| Nick_name          | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| Last_name          | string | null: false               |
| First_name         | string | null: false               |
| Last_name_kana     | string | null: false               |
| First_name_kana    | string | null: false               |
| birth_day          | date   | null: false               |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column              | Type       | Options     |
| ------------------- | ---------- | ----------- |
| name                | string     | null: false |
| category            | string     | null: false |
| explanation         | text       | null: false |
| situation_id        | integer    | null: false |
| delivery_charge_id  | integer    | null: false |
| region_of_origin_id | integer    | null: false |
| day_to_ship_id      | integer    | null: false |
| price               | integer    | null: false |
| user_id             | references | null: false, foreign_key: true |

### Association

- has_one :order
- belongs_to :user

## orders テーブル

| Column    | Type       | Options                        |
| ------    | ---------- | ------------------------------ |
| user_id   | references | null: false, foreign_key: true |
| item_id   | references | null: false, foreign_key: true |

### Association

- has_one :item
- belongs_to :user

## informations テーブル

| Column              | Type       | Options                          |
| -------             | ---------- | ---------------------------------|
| post_code           | string     | null: false                      |
| region_of_origin_id | integer    | null: false                      |
| municipalities      | string     | null: false                      |
| address             | string     | null: false                      |
| building_name       | string     |                                  |
| number              | string     | null: false                      |
| order_id            | references | null: false, foreign_key: true   |

### Association

- belongs_to :order