![test_image](https://github.com/TMY-GH/images/blob/main/top.png, "test")
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

