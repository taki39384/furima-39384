# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| Nick name          | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| name               | string | null: false |
| name_kana          | string | null: false |
| birth_day          | date   | null: false |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column              | Type       | Options     |
| ------------------- | ---------- | ----------- |
| name                | string     | null: false |
| category            | string     | null: false |
| explanation         | string     | null: false |
| situation           | string     | null: false |
| delivery_charge     | string     | null: false |
| region_of_origin    | string     | null: false |
| day_to_ship         | string     | null: false |
| price               | string     | null: false |
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

## information テーブル

| Column            | Type       | Options       |
| -------           | ---------- | ------------- |
| post_code         | string     | null: false   |
| prefectures       | string     | null: false   |
| municipalities    | string     | null: false   |
| address           | string     | null: false   |
| Building name     | string     | null: false   |
| number            | string     | null: false   |

### Association

- has_one :order