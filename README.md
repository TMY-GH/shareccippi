# ShaRecipe (シェアシピ)
料理のレシピを閲覧、投稿、共有することができるアプリ

URL: http://35.76.50.254/ (現在、本番環境は使えませんのでローカルでお試しください)<br>

Basic認証<br>
ユーザーID: noa<br>
パスワード: 0801

テスト用アカウント(ご自由にお使いください)<br>
ユーザーID: test01<br>
パスワード: aaa000


# 概要
共働きが当たり前になり、男性が外で働いて女性が家で家事をするという考え方は古いというのが社会に浸透してきています。ですが実際はいまだに共働きの家庭でも女性の方が家事の平均割合が高いというのが現状です。その中でも料理は家事の中でもっとも女性の比率が高いものとなっています。<br>

このアプリは普段料理をしない人でもレシピを見ることで料理をし、<b><u>女性にかかる料理に関する負担を家族で均一化することを目的としたアプリ</u></b>です。


# 課題
| 課題                | 課題解決                                                  |
| -------------------| ---------------------------------------------------------|
| 料理の作り方が分からない| 調理方法は１から順番に記載されているので順序通りに調理することを目指してもらいます。また調理画像も添付することが可能にし文字だけでは伝わりにくい、実際の調理の様子も表示させます。|
| どのレシピを作ればいいのか分からない | レシピには調理難易度をつけ、不慣れな方は簡単なレシピを選べます。また家にある材料から作れるレシピがあるか検索できます。|
| 作る人が増えると食材の管理が難しい | 他家族でユーザーのグループを作ってもらいレシピを共有して頂ければ、家族からお願いされたレシピを閲覧できどの食材を使うのか共有できます。またグループ間でレシピから買い物リストを作成することができ、買い出しの際に何を買えばいいのかが分かります。|
| 自分のレシピを公開したくない | レシピには非公開設定もあり、非公開のレシピは自分と任意のグループのメンバーしか閲覧できません。|

# 機能一覧
| 機能                       | 機能詳細                                   |
| --------------------------|-------------------------------------------|
| ユーザー管理機能            | ユーザーの新規登録、ログイン、ログアウトが可能    |
| レシピ一覧機能(非ログイン可) | 公開設定で投稿されたレシピが一覧可能             |
| レシピ検索機能(非ログイン可) | 材料からその材料を使うレシピが表示されます        |
| レシピ詳細機能(非ログイン可) | レシピの詳細な情報の閲覧が可能                  |
| レシピ投稿機能             | 料理のレシピの作成が可能                       |
| レシピ編集機能             | 自身が投稿したレシピのみ編集が可能               |
| レシピ削除機能             | 自身が投稿したレシピの削除が可能                 |
| レシピレビュー機能          | 他の人が投稿したレシピにコメントと調理難易度のレビューが可能|
| レシピ調理難易度機能         | 投稿時やレビューに投稿された調理難易度の平均が表示されます |

## お気に入り機能
| 機能                       | 機能詳細                                   |
| --------------------------|-------------------------------------------|
| お気に入り追加機能           | 自他問わずレシピをお気に入りに追加することが可能  |
| お気に入り削除機能           | 既にお気に入りのレシピの場合、お気に入りから削除することが可能 |

## マイページ機能
| 機能                       | 機能詳細                                   |
| --------------------------|-------------------------------------------|
| マイページ機能              | 自身のレシピとお気に入りのレシピの閲覧が可能      |

## グループ機能
| 機能                       | 機能詳細                                   |
| --------------------------|-------------------------------------------|
| グループ一覧機能            | 自身の所属しているグループが一覧で閲覧可能        |
| グループ詳細機能            | グループのメンバーと共有されるレシピの閲覧が可能   |
| グループ作成機能            | 他のユーザーとのグループを作成することが可能      |
| グループ編集機能            | グループ名やグループメンバーの追加が可能          |
| グループ脱退機能            | 任意のグループから脱退することが可能              |
| グループ削除機能            | グループ作成者はグループの削除が可能              |
| グループ招待機能            | 任意のグループにのみ参加できるよう招待から参加の同意と拒否の選択が可能 |
| グループレシピ追加機能       | グループに自身のお気に入りのレシピから任意のレシピを追加することが可能 |
| グループレシピ削除機能       | グループメンバーはグループからレシピを削除することが可能 |
| グループ買い物リスト機能     | グループのレシピ内から選択されたレシピの材料リストの作成、上書きが可能 |

# 使用方法

## アカウント作成
ヘッダーのアカウント作成ボタンからアカウント作成画面へ遷移します。

<img src="https://github.com/TMY-GH/images/blob/main/create_account.gif?raw=true" width="100%">

## ログイン
既にアカウントをお持ちの場合、ヘッダーのログインボタンからログイン画面へ遷移します。
ログインにはアカウント作成時のユーザーIDとパスワードが必要です。

<img src="https://github.com/TMY-GH/images/blob/main/sign_in.gif?raw=true" width="100%">

## ログアウト
ログイン状態の場合、ヘッダーのログアウトボタンでログアウトします。

<img src="https://github.com/TMY-GH/images/blob/main/sign_out.gif?raw=true" width="100%">


## レシピの一覧・検索
公開されているレシピが一覧できます。また材料によるレシピの検索をすることができます。

<img src="https://github.com/TMY-GH/images/blob/main/recipe_index.gif?raw=true" width="100%">

## レシピの詳細
レシピ一覧画面からレシピを一つクリックすると詳細画面に遷移します。<br>
レシピの調理時間、人数、費用（任意入力）、材料、調理方法を確認できます。

<img src="https://github.com/TMY-GH/images/blob/main/recipe_show.gif?raw=true" width="100%">

## レシピの投稿
ヘッダーのレシピ投稿ボタンを押すとレシピ投稿画面に遷移します。<br>
料理名、料理の写真（任意）、調理時間、人数、材料、調理方法（画像は任意）、公開設定、費用、調理難易度の入力をしレシピを作るボタンを押すとレシピが投稿されます。

<img src="https://github.com/TMY-GH/images/blob/main/recipe_new.gif?raw=true" width="100%">

## レシピの編集
レシピ詳細画面からレシピ投稿者の場合、編集ボタンを押すことでレシピ編集ページへ遷移します。<br>
レシピの内容を変更し、レシピ作成のボタンを押してください。

<img src="https://github.com/TMY-GH/images/blob/main/recipe_edit.gif?raw=true" width="100%">

## レシピの削除
レシピ詳細画面からレシピ投稿者の場合、削除ボタンを押すことで削除確認画面が表示されます。<br>
削除する場合は「はい」を押してください。

<img src="https://github.com/TMY-GH/images/blob/main/recipe_destroy.gif?raw=true" width="100%">

## レシピのコメントレビュー機能
レシピ詳細画面の下部に本人以外はレシピのレビューを行うことができます。<br>
レシピの感想と調理難易度を選択し、送信してください。レビューを取り消したい場合はコメントの削除ボタンを押してください。

<img src="https://github.com/TMY-GH/images/blob/main/recipe_review.gif?raw=true" width="100%">

## レシピのお気に入り
レシピの詳細画面の右上の星マークを押すことでお気に入りのレシピに追加することができます。<br>
もしお気に入りから外す場合は、黄色い星マークをもう１度押してください。

<img src="https://github.com/TMY-GH/images/blob/main/recipe_favorite.gif?raw=true" width="100%">

## マイページ
ヘッダーの自身の名前を押すことでマイページに遷移します。<br>
マイページでは自身の投稿したレシピが閲覧できます。また公開設定のレシピ、非公開のレシピのみ表示することが可能です。右上の「お気に入りのレシピ」ボタンを押すことでお気に入りのレシピを表示します。

<img src="https://github.com/TMY-GH/images/blob/main/my_page.gif?raw=true" width="100%">

## グループの作成・招待
ヘッダーのグループボタンからグループ一覧ページに遷移します。<br>
そこからグループ作成ボタンを押すことでグループ作成画面へ遷移します。<br>
グループ名と招待したいユーザーのIDを入力し、グループを作成してください。招待されたユーザーはグループ一覧画面に招待の通知が届くので、参加する場合は「参加する」を押してください。

<img src="https://github.com/TMY-GH/images/blob/main/group_new.gif?raw=true" width="100%">

## グループの編集
グループのメンバーであれば誰でも新しくユーザーの招待、グループ名の変更を行うことができます。

<img src="https://github.com/TMY-GH/images/blob/main/group_edit.gif?raw=true" width="100%">


## グループの脱退
グループ一覧画面でグループ名を押すことで、グループ詳細画面に遷移します。<br>
グループ詳細画面の下部の脱退ボタンを押すことでグループから脱退します。

<img src="https://github.com/TMY-GH/images/blob/main/group_exit.gif?raw=true" width="100%">


## グループの削除
ユーザーがグループ作成者の場合、グループ一覧画面からグループの削除を行えます。

<img src="https://github.com/TMY-GH/images/blob/main/group_destroy.gif?raw=true" width="100%">


## グループでレシピをシェアする
グループ一覧画面、またはグループ詳細画面の「レシピを追加する」ボタンからグループで共有したいレシピを選ぶことができます。<br>
追加するレシピはご自身のお気に入りのレシピから選ぶことができます。

<img src="https://github.com/TMY-GH/images/blob/main/group_recipe_new.gif?raw=true" width="100%">

## グループで買い物リストを作る
グループに共有されているレシピがある状態でグループ詳細画面の右上の買い物リストボタンを押すことで買い物リスト画面へ遷移します。<br>
買い物リストに材料を追加したいレシピをグループに共有されているレシピから選択し、リストの作成を押すことでそのレシピの材料のチェックリストが作成されます。

<img src="https://github.com/TMY-GH/images/blob/main/group_shopping.gif?raw=true" width="100%">


# 開発環境
- VSCode
- Ruby 2.6.5
- Rails 6.0.0
- gem 3.2.24
- MySQL2 0.5.3
- JavaScript

# 本番環境
- AWS(EC2, S3)
- アプリケーションサーバー: Unicorn 5.4.1
- Webサーバー: Nginx 1.20.0

# ローカル環境での動作環境
% git clone https://github.com/TMY-GH/shareccippi.git<br>
% cd shareccippi<br>
% bundle install<br>
% rails db:create<br>
% rails db:migrate<br>
% rails s<br>
http://localhost:3000 にアクセス


# データベース設計

## Userテーブル

| Column                   | Type          | Option                         |
|--------------------------|---------------|--------------------------------|
| nick_name                | string        | null: false                    |
| user_name                | string        | null: false                    |
| encrypted_password       | string        | null: false                    |

### Association
- has_many :recipes

- has_many :user_likes
- has_many :favorites, through: :user_likes, source: :recipe

- has_many :user_groups
- has_many :groups, through: :user_groups
- has_many :group_owners
- has_many :own_groups, through: :group_owners, source: :group
- has_many :group_invitations
- has_many :invited_groups, through: :group_invitations

- has_many :reviews

********************************************************************************

## Recipeテーブル

| Column                   | Type          | Option                         |
|--------------------------|---------------|--------------------------------|
| name                     | string        | null: false                    |
| minute_id                | integer       | null: false                    |
| serving_id               | integer       | null: false                    |
| publish_id               | integer       | null: false                    |
| price                    | string        |                                |
| caution                  | text          |                                |
| user                     | references    | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_many :recipe-ingredients
- has_many :ingredients, through: :recipe_ingredients
- has_many :cookings
- has_many :cooking_images
- has_many :user_likes
- has_many :users, through: :user_likes
- has_many :group_likes
- has_many :reviews

********************************************************************************

## Ingredientテーブル

| Column                   | Type          | Option                         |
|--------------------------|---------------|--------------------------------|
| name                     | string        | null: false                    |
| genre                    | string        | null: false                    |

### Association
- has_many :recipe_ingredients
- has_many :recipes, through: :recipe_ingredients

********************************************************************************

## recipe_ingredientテーブル

| Column                   | Type          | Option                         |
|--------------------------|---------------|--------------------------------|
| ingredient               | references    | null: false, foreign_key: true |
| amount                   | string        | null: false                    |
| recipe_id                | references    | null: false, foreign_key: true |

### Association
- belongs_to :recipe
- belongs_to :ingredient
- has_many :group_shopping_lists
- has_many :group_shoppings, through: :group_shopping_lists

********************************************************************************

## Cookingテーブル

| Column                   | Type          | Option                         |
|--------------------------|---------------|--------------------------------|
| content                  | text          | null: false                    |
| recipe_id                | references    | null: false, foreign_key: true |

### Association
- belongs_to :recipe

********************************************************************************

## Cooking_imageテーブル

| Column                   | Type          | Option                         |
|--------------------------|---------------|--------------------------------|
| image                    | ActiveStorage |                                |
| recipe_id                | references    | null: false, foreign_key: true |

### Association
- belongs_to :recipe

********************************************************************************

## Groupテーブル

| Column                   | Type          | Option                         |
|--------------------------|---------------|--------------------------------|
| name                     | string        | null: false                    |

### Association
- has_many :user_groups
- has_many :users, through: :user_groups
- has_many :group_likes
- has_many :recipes, through: :group_likes
- has_many :group_invitations
- has_many :invited_users, through: :group_invitations, source: :user
- has_one :group_owner
- has_one :owner, through: :group_owner, source: :user

********************************************************************************

## user_groupテーブル
| Column                   | Type          | Option                         |
|--------------------------|---------------|--------------------------------|
| user_id                  | references    | null: false, foreign_key: true |
| group_id                 | references    | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :group

********************************************************************************

## group_ownerテーブル
| Column                   | Type          | Option                         |
|--------------------------|---------------|--------------------------------|
| user                     | references    | null: false, foreign_key: true |
| group                    | references    | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :group

********************************************************************************

## group_invitationテーブル
| Column                   | Type          | Option                         |
|--------------------------|---------------|--------------------------------|
| user                     | references    | null: false, foreign_key: true |
| group                    | references    | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :group

********************************************************************************

## user_likeテーブル
| Column                   | Type          | Option                         |
|--------------------------|---------------|--------------------------------|
| user_id                  | references    | null: false, foreign_key: true |
| recipe_id                | references    | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :recipe

********************************************************************************

## group_likeテーブル
| Column                   | Type          | Option                         |
|--------------------------|---------------|--------------------------------|
| group_id                 | references    | null: false, foreign_key: true |
| recipe_id                | references    | null: false, foreign_key: true |

### Association
- belongs_to :group
- belongs_to :recipe

*****

## Reviewテーブル
| Column                   | Type          | Option                         |
|--------------------------|---------------|--------------------------------|
| difficulty               | integer       | null: false                    |
| comment                  | text          |                                |
| recipe_id                | references    | null: false, foreign_key: true |
| user_id                  | references    | null: false, foreign_key: true |

### Association
- belongs_to :users
- belongs_to :recipes

********************************************************************************

## Group_shoppingテーブル
| Column                   | Type          | Option                         |
|--------------------------|---------------|--------------------------------|
| memo                     | text          |                                |
| group_id                 | references    | null: false, foreign_key: true |

### Association
- has_many :group_shopping_lists
- has_many :recipe_ingredients, through: :group_shopping_lists

********************************************************************************

## Group_shopping_listテーブル
| Column                   | Type          | Option                         |
|--------------------------|---------------|--------------------------------|
| group_shopping_id        | references    | null: false, foreign_key: true |
| recipe_ingredient_id     | references    | null: false, foreign_key: true |

### Association
- belongs_to :group_shopping
- belongs_to :recipe_ingredient

