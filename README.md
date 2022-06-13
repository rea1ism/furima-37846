# テーブル設計

## users テーブル

| Column                 | Type      | Options                        |
| ---------------------- | --------- | ------------------------------ |
| nickname               | string    | null: false                    |
| email                  | string    | null: false, unique: true      |
| encrypted_password     | string    | null: false                    |
| familyname_kanji       | string    | null: false                    |
| firstname_kanji        | string    | null: false                    |
| familyname_kana        | string    | null: false                    |
| firstname_kana         | string    | null: false                    |
| birth_day              | date      | null: false                    |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column                 | Type      | Options                        |
| ---------------------- | --------- | ------------------------------ |
| user                   | reference | null: false, foreign_key: true |
| item_name              | string    | null: false                    |
| description            | text      | null: false                    |
| category_id            | integer   | null: false                    |
| status_id              | integer   | null: false                    |
| transportation_cost_id | integer   | null: false                    |
| shipping_pref_id       | integer   | null: false                    |
| leadtime_id            | integer   | null: false                    |
| price                  | integer   | null: false                    |

### Association

- belongs_to :user
- has_one :purchase

## purchases テーブル

| Column                 | Type      | Options                        |
| ---------------------- | --------- | ------------------------------ |
| item_id                | reference | null: false, foreign_key: true |
| user_id                | reference | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :destination

## destinations テーブル

| Column                 | Type      | Options                        |
| ---------------------- | --------- | ------------------------------ |
| post_code              | string    | null: false                    |
| prefecture             | string    | null: false                    |
| city                   | string    | null: false                    |
| street_number          | string    | null: false                    |
| building               | string    |                                |
| phone_number           | string    | null: false                    |
| purchase_id            | reference | null: false, foreign_key: true |

### Association

- belongs_to :purchase