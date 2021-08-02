# ShaRecipe (シェアシピ)
料理のレシピを閲覧、投稿、共有することができるアプリ

![test_image](https://github.com/TMY-GH/images/blob/main/top.png?raw=true, "test")

# 課題
共働きが当たり前になり、男性が外で働いて女性が家で家事をするという考え方は古いというのが社会に浸透してきています。ですが実際はいまだに共働きの家庭でも女性の方が家事の平均割合が高いというのが現状です。その中でも料理は家事の中でもっとも女性の比率が高いものとなっています。<br>

このアプリは普段料理をしない人でもレシピを見ることで料理をし、<b><u>女性にかかる料理に関する負担を家族で均一化することを目的としたアプリ</u></b>です。

| 課題                | 課題解決                                                  |
| -------------------| ---------------------------------------------------------|
| 料理の作り方が分からない| 調理方法は１から順番に記載されているので順序通りに調理することを目指してもらいます。また調理画像も添付することが可能にし文字だけでは伝わりにくい、実際の調理の様子も表示させます。|
| どのレシピを作ればいいのか分からない | レシピには調理難易度をつけ、不慣れな方は簡単なレシピを選べます。また家にある材料から作れるレシピがあるか検索できます。|
| 作る人が増えると食材の管理が難しい | 他家族でユーザーのグループを作ってもらいレシピを共有して頂ければ、家族からお願いされたレシピを閲覧できどの食材を使うのか共有できます。またグループ間でレシピから買い物リストを作成することができ、買い出しの際に何を買えばいいのかが分かります。|
| 自分のレシピを公開したくない | レシピには非公開設定もあり、非公開のレシピは自分と任意のグループのメンバーしか閲覧できません。|
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

