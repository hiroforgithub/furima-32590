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
- has_many :buy

## items テーブル

| Column           | Type    | Options     |
| ------           | ------  | ----------- |
| title            | text    | null: false |
| text             | string  | null: false |
| price            | integer | null: false |
| category_id      | integer | null: false |
| status_id        | integer | null: false |
| shipping_fee_id  | integer | null: false |
| shipping_date_id | integer | null: false |

### Association

- belongs_to :user
- has_one :buy


## buys テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| item_id | references | null: false, foreign_key: true |
| user_id | references | null: false, foreign_key: true |


### Association
- belongs_to :user
- belongs_to :item
- has_one :address


## addresses テーブル

| Column            | Type       | Options                        |
| -------           | ---------- | ---------------------          |
| code              | integer    | null: false, foreign_key: true |
| prefecture_id     | integer    | null: false, foreign_key: true |
| city              | string     | null: false, foreign_key: true |
| street            | string     | null: false, foreign_key: true |
| building          | string     | foreign_key: true              |
| tel               | string     | null: false, foreign_key: true |

### Association
- belongs_to :buy
