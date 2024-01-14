# テーブル設計

## Users テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| nickname           | string     | null: false                    |
| email              | string     | null: false, unique: true      |
| encrypted_password | string     | null: false                    |


### Association

- has_many :diagnoses


## Diagnoses テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| long_fingers       | boolean    | null: false                    |
| thick_fingers      | boolean    | null: false                    |
| finger_shape       | string     | null: false                    |
| webbed_fingers     | boolean    | null: false                    |


### Association

- belongs_to :user


## RecommendedRings テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| ring_type          | string     | null: false                    |
| image              | string     | null: false                    |
| description        | text       | null: false                    |









