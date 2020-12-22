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
| address            | string | null: false               |
| profile            | string | null: false               |
| nick_name          | string | null: false               |
| birth_day          | date   | null: false               |

### Association

- has_many :items
- has_one :buy

## items テーブル

| Column           | Type    | Options     |
| ------           | ------  | ----------- |
| title            | string  | null: false |
| text             | string  | null: false |
| price            | integer | null: false |
| image            | string  | null: false |
| category_id      | string  | null: false |
| status_id        | string  | null: false |
| shipping_fee_id  | string  | null: false |
| shipping_date_id | string  | null: false |

### Association

- belongs_to :user
- belongs_to :buy


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

| Column            | Type       | Options                   |
| -------           | ---------- | ---------------------     |
| code              | integer   | null: false               |
| prefecture        | string     | null: false               |
| city              | string     | null: false               |
| street            | string     | null: false               |
| building          | string     | null: false               |
| tel               | integer    | null: false               |

### Association
- belongs_to :buy
