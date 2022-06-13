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
| prefecture_id          | integer   | null: false                    |
| leadtime_id            | integer   | null: false                    |
| price                  | integer   | null: false                    |

### Association

- belongs_to :user
- has_one :purchase

## purchases テーブル

| Column                 | Type      | Options                        |
| ---------------------- | --------- | ------------------------------ |
| item                   | reference | null: false, foreign_key: true |
| user                   | reference | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :destination

## destinations テーブル

| Column                 | Type      | Options                        |
| ---------------------- | --------- | ------------------------------ |
| post_code              | string    | null: false                    |
| prefecture_id          | integer   | null: false                    |
| city                   | string    | null: false                    |
| street_number          | string    | null: false                    |
| building               | string    |                                |
| phone_number           | string    | null: false                    |
| purchase               | reference | null: false, foreign_key: true |

### Association

- belongs_to :purchase