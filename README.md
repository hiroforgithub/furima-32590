# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| --------           | ------ | -----------               |
| first_name         | string | null: false               |
| first_name_f       | string | null: false               |
| last_name          | string | null: false               |
| last_name_f        | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| nick_name          | string | null: false               |
| birth_day          | date   | null: false               |

### Association

- has_many :items
- has_many :buys

## items テーブル

| Column           | Type    | Options     |
| ------           | ------  | ----------- |
| title            | string  | null: false |
| text             | text    | null: false |
| price            | integer | null: false |
| category_id      | integer | null: false |
| status_id        | integer | null: false |
| shipping_fee_id  | integer | null: false |
| shipping_date_id | integer | null: false |
| user_id          | integer | null: false |
| prefecture_id    | integer | null: false |

### Association

- belongs_to :user
- has_one :buy


## buys テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| item    | references | null: false, foreign_key: true |
| user    | references | null: false, foreign_key: true |


### Association
- belongs_to :user
- belongs_to :item
- has_one :address


## addresses テーブル

| Column            | Type       | Options                        |
| -------           | ---------- | ---------------------          |
| code              | string     | null: false                    |
| prefecture_id     | integer    | null: false                    |
| city              | string     | null: false                    |
| street            | string     | null: false                    |
| building          | string     | foreign_key: true              |
| tel               | string     | null: false                    |
| buy_id            | integer    | null: false, foreign_key: true |

### Association
- belongs_to :buy
