# アプリケーション名
DIAMOND STAR

# アプリケーション概要
夜景の画像向けの、画像投稿アプリケーション
<br>

# URL
https://diamond-star.herokuapp.com/

# テスト用アカウント
* Basic認証ID: admin
* Basic認証パスワード: 2222
* メールアドレス: test1@test1
* パスワード: r12345

# 利用方法
## 画像投稿
1.トップページ(一覧ページ)のヘッダーからユーザー新規登録を行う
2.新規投稿ボタンから投稿の内容(画像,ジャンル,地域,説明)の入力や選択をし投稿する
## 他者の投稿に反応する
1.投稿詳細ページを開く
2.ハートボタンをクリックすればいいねができる、コメントフォームにコメントを入力してコメントするボタンを押せば投稿内容にコメントすることができる。

# アプリケーションを作成した背景
学習を進めていく上で画像投稿アプリを作りたいと思った。最近SNSの需要が高まっているニュースを見て利用率を調べたところ20代が圧倒的に多かった。スマホで写真撮影する頻度を調査したところ20代はほぼ毎日撮影することがわかり、そこからさらに何を撮影しているのか調査しているところ景色が大半を占めていることが判明した。個人的に利用しているSNSを見ると、夜中に
ドライブしている人が増えてきていることがわかった。そこで20代の男女をターゲットに簡単に利用できるように夜景専用の画像投稿アプリケーションがあれば利用者も多いのではないかと考え作成に至る。

参考<br>
[SNSの利用率](https://smmlab.jp/article/sns-user-number/)

[年代別撮影する頻度](https://www.asahigroup-holdings.com/company/research/hapiken/maian/201707/00640/)

[よく撮影するもの](https://www.itmedia.co.jp/makoto/articles/0704/24/news095.html#:~:text=%E3%81%9D%E3%82%8C%E3%81%A7%E3%81%AF%E4%BD%95%E3%82%92%E6%92%AE%E3%81%A3%E3%81%A6,3%E5%89%B2%E3%82%92%E8%B6%85%E3%81%88%E3%81%9F%E3%80%82)

# 洗い出した要件
[要件シート](https://docs.google.com/spreadsheets/d/16qZyRM6nZjU42bFhWkwgSE-efc9PKPqLDTcnyLd_7lE/edit#gid=982722306)



# 今後実装予定の機能
* 検索機能
* GoogleマップのAPIを使用して撮影地もシェアできるようにする

# データベース設計
[![Image from Gyazo](https://i.gyazo.com/eb1a755ca80ac4080d6fad8992e666e3.png)](https://gyazo.com/eb1a755ca80ac4080d6fad8992e666e3)

# 画面遷移図
[![Image from Gyazo](https://i.gyazo.com/f555e105a0a238b8652dacf12351940e.png)](https://gyazo.com/f555e105a0a238b8652dacf12351940e)
# 開発環境
* フロントエンド
* バックエンド
* インフラ
* テキストエディタ
* タスク管理

# ローカルでの動作方法
* % git clone https://github.com/sorasora313/diamond-star.git
* % cd diamond-star
* % bundle install
* % yarn install

# 工夫したポイント
1.20代が使いたくなるようなHTMLの背景、ヘッダーのデザインに特にこだわった。<br>
2.地域とジャンルはプルダウンの選択式、タイトルと説明のみテキストへ入力する必要があるので簡単にすぐ投稿できるように投稿に必要な項目の選別を行った。<br>
3.いいねボタンもいいねしていなかった場合いいねを押そうと強調していたので多くの人が押してくれることを見込めるようにいいね機能を実装した。<br>
4.スマホでも利用できるように実際にスマホで利用しながらCSSを実装した。



# データテーブル

## usersテーブル

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
