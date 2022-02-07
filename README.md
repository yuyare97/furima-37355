# テーブル設計

## users テーブル

| Column                | Type   | Options                   |
| --------------------- | ------ | --------------------------|
| nickname              | string | null: false               |
| email                 | string | null: false, unique: true |
| password              | string | null: false               |
| password_confirmation | string | null: false               |
| last_name             | string | null: false               |
| first_name            | string | null: false               |
| last_name_kana        | string | null: false               |
| first_name_kana       | string | null: false               |
| birthday              | date   | null: false               |

### Association

- has_many :items
- has_one :buyers
- has_one :cards


## items テーブル

| Column                | Type        | Options                        |
| --------------------- | ----------- | -------------------------------|
| image                 | string      | null: false                    |
| name                  | string      | null: false                    |
| description           | text        | null: false                    |
| category              | string      | null: false                    |
| condition             | string      | null: false                    |
| burden                | string      | null: false                    |
| prefecture            | string      | null: false                    |
| days                  | string      | null: false                    |
| price                 | integer     | null: false                    |
| user                  | references  | null: false, foreign_key: ture |

### Association

- belongs_to :users




## buyers テーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | -------------------------------|
| postcode              | string     | null: false                    |
| prefecture            | string     | null: false                    |
| city                  | string     | null: false                    |
| address               | string     | null: false                    |
| apartment_name        | string     |                                |
| phone_number          | string     | null: false                    |
| user                  | references | null: false, foreign_key: true |

### Association

- belongs_to :users




## cards テーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | -------------------------------|
| user                  | references | null: false, foreign_key: true |

### Association

- belongs_to :users