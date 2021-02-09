# テーブル設計

## usersテーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |


### Association

- has_many :favorites
- has_many :lists

## foodsテーブル

| Column       | Type    | Options     |
| ------------ | ------- | ----------- |
| name         | string  | null: false |
| calorie      | integer | null: false |
| protein      | integer | null: false |
| fat          | integer | null: false | 
| carbohydrate | integer | null: false |
| category_id  | integer | null: false |

### Association

- has_many :favorites
- belongs_to :category

## categoriesテーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| genre  | string | null: false |

### Association

- has_many :foods

## favoritesテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| food   | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :food

## listsテーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| today       | date       | null: false                    |
| exercise_id | integer    | null: false                    |
| user        | references | null: false, foreign_key: true |


### Association

- belongs_to :user