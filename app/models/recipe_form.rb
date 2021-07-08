class RecipeForm
  include ActiveModel::Model
  attr_accessor :recipe_name, :recipe_image, :time, :serving, :publish, :price, :user,
                :ingredient_id, :amount, :recipe_id,
                :content, :caution

# Validation
  with_options presence: true do
    validates :recipe_name
    validates :recipe_image
    validates :time
    validates :serving
    validates :publish
    validates :price
    validates :ingredient_id
    validates :amount
    validates :content
  end
  # ActiveHashは0を選べない
  with_options numericality: { other_than: 0 } do
    validates :time
    validates :serving
    validates :publish
    validates :ingredient_id
  end
  validates :price, format: { with: /\A[0-9０-９]+\z/ }


# Method
  def save
    recipe = Recipe.create(name: recipe_name, time_id: time, serving_id: serving, publish_id: publish, price: price, user_id: current_user.id)
    RecipeIngredient.create(ingredient_id: ingredient_id, amount: amount, recipe_id: recipe.id)
    Cooking.create(content: content, recipe_id: recipe.id)
  end

end

