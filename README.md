# テーブル設計

## users テーブル

| column             | type   | options                   |
| ------------------ | ------ | --------------------------|
| nick_name          | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birth_day          | date   | null: false               |

### Association

- has_many :items
- has_many :orders

## items テーブル

| column              | type       | options     |
| ------------------- | ---------- | ----------- |
| name                | string     | null: false |
| category_id         | integer    | null: false |
| explanation         | text       | null: false |
| situation_id        | integer    | null: false |
| delivery_charge_id  | integer    | null: false |
| region_of_origin_id | integer    | null: false |
| day_to_ship_id      | integer    | null: false |
| price               | integer    | null: false |
| user                | references | null: false, foreign_key: true |

### Association

- has_one :order
- belongs_to :user

## orders テーブル

| column    | type       | options                        |
| ------    | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :information

## informations テーブル

| column              | type       | options                          |
| -------             | ---------- | ---------------------------------|
| post_code           | string     | null: false                      |
| region_of_origin_id | integer    | null: false                      |
| municipalities      | string     | null: false                      |
| address             | string     | null: false                      |
| building_name       | string     |                                  |
| number              | string     | null: false                      |
| order               | references | null: false, foreign_key: true   |

### Association

- belongs_to :order