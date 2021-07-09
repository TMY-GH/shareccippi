class RecipeForm
  include ActiveModel::Model
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


  # amountは数字だけ && 食材で線になっている場所
  def validates_ingredient_id_and_amount?
    i = 0
    ingredient_ids.each do |ingredient_id|
      ingredient_id = ingredient_id.to_i
      amount = amounts[i]
      # validates :ingredient_id, numericality: { other_than: 1, other_than: 6, other_than: 23, other_than: 32, other_than: 37 }
      # validates :amount, format: { with: /\A[0-9０-９]+\z/ }
      unless /\A[0-9０-９]+\z/.match?(amount) && ingredient_id != 1 && ingredient_id != 6 && ingredient_id != 23 && ingredient_id != 32 && ingredient_id != 37
        return false
      end
      i += 1
    end
  end
end

