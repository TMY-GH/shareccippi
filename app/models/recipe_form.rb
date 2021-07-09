class RecipeForm
  include ActiveModel::Model
  include ActiveModel::Validations
  include ActiveModel::Attributes

  attr_accessor :recipe_name, :recipe_image, :minute, :serving, :publish, :price, :user_id,
                :ingredient_ids, :amounts, :recipe_id,
                :content, :caution,
                :ingredient_id, :amount

# Validation
  with_options presence: true do
    validates :recipe_name
    validates :recipe_image, presence: { message: "を選択してください" }
    validates :minute
    validates :serving
    validates :publish
    validates :user_id
    validates :ingredient_ids
    validates :amounts
    validates :content
  end
  # ActiveHashは0を選べない
  with_options numericality: { other_than: 0, message: "は---以外を選択してください" } do
    validates :minute
    validates :serving
    validates :publish
  end
  # 値段は半角か全角の数字のみ可能
  with_options format: { with: /\A[0-9０-９]+\z/ } do
    validates :price, unless: :blank?
  end

  # 材料のバリデーション
  validates :ingredient_ids, ingredients: true

  # 量のバリデーション
  validates :amounts, amount: true

# Method
  def save
    recipe = Recipe.create(name: recipe_name, image: recipe_image, minute_id: minute, serving_id: serving, publish_id: publish, price: price, user_id: user_id)
    i = 0
    ingredient_ids.each do |ingredient_id|
      amount = amounts[i]
      amount.to_i
      RecipeIngredient.create(ingredient_id: ingredient_id, amount: amount, recipe_id: recipe.id)
      i += 1
    end
    Cooking.create(content: content, recipe_id: recipe.id)
  end
end

