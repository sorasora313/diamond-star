# アプリケーション名











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
