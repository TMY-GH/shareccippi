# ShaRecipe (シェアシピ)
料理のレシピを閲覧、投稿、共有することができるアプリ

<!-- ![test_image](https://github.com/TMY-GH/images/blob/main/top.png?raw=true, "test") -->

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
| レシピ詳細機能(非ログイン可) | レシピの詳細な情報の閲覧が可能                  |
| レシピ投稿機能             | 料理のレシピの作成が可能                       |
| レシピ編集機能             | 自身が投稿したレシピのみ編集が可能               |
| レシピ削除機能             | 地震が投稿したレシピの削除が可能                 |

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
ヘッダーのアカウント作成ボタンからアカウント作成画面へ遷移します
<img src="https://github.com/TMY-GH/images/blob/main/create_account.gif?raw=true" width="100%">

# テーブル設計

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

*****

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

*****

## Ingredientテーブル

| Column                   | Type          | Option                         |
|--------------------------|---------------|--------------------------------|
| name                     | string        | null: false                    |
| genre                    | string        | null: false                    |

### Association
- has_many :recipe_ingredients
- has_many :recipes, through: :recipe_ingredients

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

*****

## Cookingテーブル

| Column                   | Type          | Option                         |
|--------------------------|---------------|--------------------------------|
| content                  | text          | null: false                    |
| recipe_id                | references    | null: false, foreign_key: true |

### Association
- belongs_to :recipe

*****

## Cooking_imageテーブル

| Column                   | Type          | Option                         |
|--------------------------|---------------|--------------------------------|
| image                    | ActiveStorage |                                |
| recipe_id                | references    | null: false, foreign_key: true |

### Association
- belongs_to :recipe

*****

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
*****

## user_groupテーブル
| Column                   | Type          | Option                         |
|--------------------------|---------------|--------------------------------|
| user_id                  | references    | null: false, foreign_key: true |
| group_id                 | references    | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :group
*****

## group_ownerテーブル
| Column                   | Type          | Option                         |
|--------------------------|---------------|--------------------------------|
| user                     | references    | null: false, foreign_key: true |
| group                    | references    | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :group
*****

## group_invitationテーブル
| Column                   | Type          | Option                         |
|--------------------------|---------------|--------------------------------|
| user                     | references    | null: false, foreign_key: true |
| group                    | references    | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :group
*****

## user_likeテーブル
| Column                   | Type          | Option                         |
|--------------------------|---------------|--------------------------------|
| user_id                  | references    | null: false, foreign_key: true |
| recipe_id                | references    | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :recipe
*****

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

*****

## Group_shoppingテーブル
| Column                   | Type          | Option                         |
|--------------------------|---------------|--------------------------------|
| memo                     | text          |                                |
| group_id                 | references    | null: false, foreign_key: true |

### Association
- has_many :group_shopping_lists
- has_many :recipe_ingredients, through: :group_shopping_lists

*****

## Group_shopping_listテーブル
| Column                   | Type          | Option                         |
|--------------------------|---------------|--------------------------------|
| group_shopping_id        | references    | null: false, foreign_key: true |
| recipe_ingredient_id     | references    | null: false, foreign_key: true |

### Association
- belongs_to :group_shopping
- belongs_to :recipe_ingredient

