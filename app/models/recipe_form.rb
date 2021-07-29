class RecipeForm
  include ActiveModel::Model
  include ActiveModel::Validations
  include ActiveModel::Attributes

  attr_accessor :recipe_name, :recipe_image, :minute, :serving, :publish, :price, :user_id, :caution,
                :ingredient_ids, :amounts, :recipe_id,
                :contents, :cooking_images,
                :difficulty

# --- Validation -------------------------
  with_options presence: true do
    validates :recipe_name
    validates :minute
    validates :serving
    validates :publish
    validates :user_id
    validates :ingredient_ids
    validates :amounts
    validates :contents
    validates :difficulty
  end
  # ActiveHashは0を選べない
  with_options numericality: { other_than: 0, message: "は---以外を選択してください" } do
    validates :minute
    validates :serving
    validates :publish
  end
  # 値段は半角か全角の数字のみ可能
  with_options format: { with: /\A[0-9０-９]+(\.[0-9０-９]+)?\z/ } do
    validates :price, if: :blank?
  end

  # 材料(配列)のバリデーション 「---」を選択できない
  validates :ingredient_ids, ingredients: true

  # 量(配列)のバリデーション
  validates :amounts, amount: true

  # 調理方法(配列)のバリデーション
  validates :contents, content: true

  # 調理難易度は1~3以外選べない
  validates :difficulty, numericality: { :greater_than_or_equal_to => 1, :less_than_or_equal_to => 3, message: "が正しく選択されていません" }


# --- Method ----------------------------

  def save
    recipe = Recipe.create(name: recipe_name, image: recipe_image, minute_id: minute, serving_id: serving, publish_id: publish, price: price, caution: caution, user_id: user_id)
    i = 0
    # 材料と量を複数のレコードで保存
    ingredient_ids.each do |ingredient_id|
      amount = amounts[i]
      # 全角を半角にする
      amount.tr('０-９ａ-ｚＡ-Ｚ','0-9a-zA-Z')
      RecipeIngredient.create(ingredient_id: ingredient_id, amount: amount, recipe_id: recipe.id)
      i += 1
    end
    # 調理方法を複数のレコードで保存
    i = 0
    contents.each do |content|
      if !cooking_images[i].nil?
        cooking_image = cooking_images[i] 
        Cooking.create(content: content, image: cooking_image, recipe_id: recipe.id)
      else
        Cooking.create(content: content, recipe_id: recipe.id)
      end
      i += 1
    end
    # 調理難易度の保存
    Review.create(difficulty: difficulty, user_id: user_id, recipe_id: recipe.id)
  end

  def update
    recipe = Recipe.find(recipe_id)
    if recipe_image.blank?
      recipe.update(name: recipe_name, minute_id: minute, serving_id: serving, publish_id: publish, price: price, caution: caution, user_id: user_id)
    else
      recipe.update(name: recipe_name, image: recipe_image, minute_id: minute, serving_id: serving, publish_id: publish, price: price, caution: caution, user_id: user_id)
    end
    # 材料の元データの削除
    ingredients = recipe.recipe_ingredients
    ingredients.each do |ingredient|
      ingredient.destroy
    end
    i = 0
    # 材料と量を複数のレコードで保存
    ingredient_ids.each do |ingredient_id|
      amount = amounts[i]
      # 全角を半角にする
      amount.tr('０-９ａ-ｚＡ-Ｚ','0-9a-zA-Z')
      RecipeIngredient.create(ingredient_id: ingredient_id, amount: amount, recipe_id: recipe.id)
      i += 1
    end
    
    # 調理方法の元データの削除
    cookings = recipe.cookings
    # 調理方法を複数のレコードで保存
    i = 0
    contents.each do |content|
      if cooking_images && !cooking_images[i].nil?
        cooking = Cooking.new(content: content, image: cooking_images[i], recipe_id: recipe.id)
        cooking.save
      else
        cooking = Cooking.new(content: content, image: cookings[i].image, recipe_id: recipe.id)
        # ここが解けません
        binding.pry
        cooking.save
      end
      i += 1
    end
    recipe.reviews.find_by(user_id: user_id).update(difficulty: difficulty)
  end

end

