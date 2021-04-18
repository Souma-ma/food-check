# アプリ名
### Food Check / Check myself


# 概要
 - 食材の栄養素やカロリーを検索できます。
 - 食材をお気に入り登録できます。
 - お気に入りした食材をマイページに保存できます。
 - ログイン後、マイページに遷移しto doリストを使用できます。
 - 基礎代謝を計算できます。

## Food Check と Check myselfで機能を分けています
### 【Food Check】
  (ユーザー登録に関わらず誰でも)  
   栄養素・カロリー検索機能

  (ユーザー登録した方)  
    お気に入り機能

  (管理者)  
    食材の栄養素と画像投稿機能  
    編集・削除機能
### 【Check myself】
  (ユーザー登録した方のみ利用可能)  
    マイページ機能  
    お気に入り一覧表示機能  
    基礎代謝計算機能  

# 本番環境
   ### URL(AWS EC2)
   http://35.72.42.61/
## ログイン情報
  #### (管理者)
  - Eメール： rizin@email.com
  - パスワード：admin3350277

  **seeds.rbに環境変数で作成しました。**
 #### (ユーザー)
  - Eメール： test@email.com
  - パスワード：test123

# 制作背景(意図)
  #### ペルソナ
   日々の食事を見直したい方を対象にしました。  
   栄養成分表示が記されていない食材などを、調べる時間の短縮に着目しました。

   また、こんなものがあればいいなという開発者である私の思いから制作しました。


# 工夫したポイント
  ログインしていなくても使用できること。  
  ログインをしているかどうか、管理者かどうかを使用するユーザーごとに機能を分けたこと。  
  管理者(開発者)として使用しながら、利用するユーザーに価値を提供するコンセプトにしたこと。

#### 未ログインユーザー
  - 検索機能のみが使用できる。
#### ログインユーザー
  - 検索機能、お気に入り機能、マイページ機能が使用できる。
#### 管理者
  - 上部のヘッダーから新規投稿ページに遷移し、  
    食材の投稿、編集・削除ができる



# 実装した機能
##### 検索機能
  - ユーザーが知りたい食材の栄養素を検索できる
##### 新規登録/ログイン機能
  - お気に入り登録ができる
  - マイページ機能が使える
##### 管理者機能
  - ログインした管理者のみ食材の情報(画像、栄養素)を登録できる
  - 情報の編集・削除が行える。
##### お気に入り機能
  - 食材情報の下の星をクリックするとお気に入りができる
##### マイページ機能
  - お気に入り登録した食材の一覧表示
  - 基礎代謝計算機能


# 使用技術(開発環境)
  ## バックエンド
    Ruby on rails 6.0
    Ruby 2.6.5  
  ## フロントエンド
    HTML  CSS  JavaScript
  ## データベース
    MySQL
  ## ソース管理
    GitHub , GitHub Desktop
  ## テスト
    RSpec
  ## エディタ
    VSCode

# 課題や今後実装したい機能
  フロントのデザインにこだわること。  
  Ajaxで非同期通信を用いること。  
  食材だけでなく、レシピ検索機能であったり、  
  1日の摂取カロリーや栄養素をグラフで見れるような機能を実装していこうと思います。




# DB設計

## usersテーブル

| Column             | Type     | Options                      |
| ------------------ | -------  | -------------------------    |
| nickname           | string   | null:    false               |
| email              | string   | null:    false, unique: true |
| encrypted_password | string   | null:    false               |
| admin              | boolean  | default: false

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

<!-- ## categoriesテーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| genre  | string | null: false |

### Association

- has_many :foods -->

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
| exercise    | integer    | null: false                    |
| user        | references | null: false, foreign_key: true |


### Association

- belongs_to :user