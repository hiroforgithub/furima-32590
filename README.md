# テーブル設計

## users テーブル

| Column    | Type   | Options     |
| --------  | ------ | ----------- |
| name      | string | null: false |
| email     | string | null: false |
| password  | string | null: false |
| address   | string | null: false |
| profile   | string | null: false |
| nick_name | string | null: false |

### Association

- has_many :items

## items テーブル

| Column        | Type   | Options     |
| ------        | ------ | ----------- |
| title         | string | null: false |
| text          | string | null: false |
| image         | string | null: false |
| category      | string | null: false |
| status        | string | null: false |
| shipping_fee  | string | null: false |
| shipping_date | string | null: false |

### Association

- belongs_to :user

## buys テーブル

| Column  | Type       | Options                             |
| ------- | ---------- | ------------------------------      |
| item         | references | null: false, foreign_key: true |
| seller       | references | null: false, foreign_key: true |
| buyer        | references | null: false, foreign_key: true |
| shipping_fee | references | null: false                    |
| shipping_fee | references | null: false                    |

### Association
- has_one :user
- has_one :item

## addresses テーブル

| Column            | Type       | Options               |
| -------           | ---------- | --------------------- |
| shipping_address  | string | null: false               |

### Association
- has_one :buy
