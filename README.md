# テーブル設計

## Userテーブル

| Column                   | Type          | Option                         |
|--------------------------|---------------|--------------------------------|
| nick_name                | string        | null: false                    |
| user_name                | string        | null: false                    |
| encrypted_password       | string        | null: false                    |

### Association
- has_one :profile
- has_many :recipes
- has_many :user_likes
- has_many :favorites, through: :user_likes, source: :recipe
- has_many :user_groups
- has_many :groups, through: :user_groups
- has_many :own_groups, source: :groups
- has_many :reviews

#### その他
Active_storageで画像のの追加<br>
*****

## Profileテーブル
| Column                   | Type          | Option                         |
|--------------------------|---------------|--------------------------------|
| content                  | text          | null: false                    |
| age                      | integer       | null: false                    |
| gender_id                | integer       | null: false                    |
| user                     | references    | null: false, foreign_key: true |

### Association
- belongs_to :user
*****

## Recipeテーブル

| Column                   | Type          | Option                         |
|--------------------------|---------------|--------------------------------|
| name                     | string        | null: false                    |
| minute_id                | integer       | null: false                    |
| serving_id               | integer       | null: false                    |
| publish_id               | integer       | null: false                    |
| price                    | string        |                                |
| user                     | references    | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_many :recipe-ingredients
- has_many :ingredients, through: :recipe_ingredients
- has_many :cookings
- has_many :user_likes
- has_many :users, through: :user_likes
- has_many :group_likes
- has_many :groups, through: :group_likes
- has_many :recipe-tags
- has_many :tags, through: :recipe-tags
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
*****

## Cookingテーブル

| Column                   | Type          | Option                         |
|--------------------------|---------------|--------------------------------|
| content                  | text          | null: false                    |
| recipe_id                | references    | null: false, foreign_key: true |
| caution                  | text          |                                |

### Association
- belongs_to :recipe

##### その他
料理方法で画像を貼り付けられるようにする
*****

## Groupテーブル

| Column                   | Type          | Option                         |
|--------------------------|---------------|--------------------------------|
| name                     | string        | null: false                    |
| user                     | references    | null: false, foreign_key: true |

### Association
- has_many :user_groups
- has_many :users, through: :user_groups
- has_many :group_likes
- has_many :recipes, through: :group_likes
- belongs_to :owner, source: :user
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
## Tagテーブル
| Column                   | Type          | Option                         |
|--------------------------|---------------|--------------------------------|
| name                     | integer       | null: false                    |

### Association
- has_many :recipe_tags
- has_many :recipes, through: :recipe_tags

*****
## recipe_tagテーブル
| Column                   | Type          | Option                         |
|--------------------------|---------------|--------------------------------|
| tag_id                   | references    | null: false, foreign_key: true |
| recipe_id                | references    | null: false, foreign_key: true |

### Association
- has_many :tags
- has_many :recipes

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
