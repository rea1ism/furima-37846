# テーブル設計

## users テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false |
| encrypted_password | string  | null: false |
| familyname_kanji   | string  | null: false |
| firstname_kanji    | string  | null: false |
| familyname_kana    | string  | null: false |
| firstname_kana     | string  | null: false |
| birth_year         | integer | null: false |
| birth_month        | integer | null: false |
| birth_day          | integer | null: false |

### Association

- has_many :items
- has_many :comments

## items テーブル

| Column              | Type      | Options                        |
| ------------------- | --------- | ------------------------------ |
| user                | reference | null: false, foreign_key: true |
| itemname            | string    | null: false                    |
| description         | text      | null: false                    |
| category            | string    | null: false                    |
| status              | string    | null: false                    |
| transportation_cost | integer   | null: false                    |
| shipping_pref       | string    | null: false                    |
| leadtime            | string    | null: false                    |
| price               | integer   | null: false                    |
| bookmark            | boolean   | null: false                    |
| inadequate_flag     | boolean   | null: false                    |
| purchased_flag      | boolean   | null: false                    |

### Association

- has_many :comments
- belongs_to :user

## comments テーブル

| Column    | Type      | Options                        |
| --------- | --------- | ------------------------------ |
| text      | text      | null: false                    |
| item      | reference | null: false, foreign_key: true |
| user      | reference | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user