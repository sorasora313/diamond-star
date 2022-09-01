# アプリケーション名
diamond-star
---

# アプリケーション概要
夜景の画像向けの、画像投稿アプリケーション
---

# URL
https://diamond-star.herokuapp.com/
---

# テスト用アカウント
* Basic認証ID: admin
* Basic認証パスワード: 2222
* メールアドレス: test1@test1
* パスワード: r12345
<br>

# 利用方法

## 画像投稿







# 洗い出した要件
[要件シート](https://docs.google.com/spreadsheets/d/16qZyRM6nZjU42bFhWkwgSE-efc9PKPqLDTcnyLd_7lE/edit#gid=982722306)

# 洗い出した要件










|Column            |Type  |Options                  |
|------------------|------|-------------------------|
|nickname          |string|null: false              |
|email             |string|null: false, unique: true|
|encrypted_password|string|null: false              |
|profile           |text  |null: false              |


### Association

has_many :nights
has_many :comments
has_many :likes


## nightsテーブル
|Column         |Type      |Options                       |
|---------------|----------|------------------------------|
|title          |string    |null: false                   |
|explain        |text      |null: false                   |
|genre_id       |integer   |null: false                   |
|state_id       |integer   |null: false                   |
|user           |references|null: false, foreign_key: true|

### Association
belongs_to :user
has_many :comments
has_one :like

## commentsテーブル

|Column       |Type      |Options                           |
|-------------|----------|----------------------------------|
|content      |text      |null: false                       |
|user         |references|null: false, foreign_key: true    |
|night        |references|null: false, foreign_key: true    |


### Association
belongs_to :user
belongs_to :night

## likesテーブル

|Column |Type      |Options                       |
|-------|----------|------------------------------|
|user   |references|null: false, foreign_key: true|
|night  |references|null: false, foreign_key: true|

### Association
belongs_to :user
belongs_to :night
