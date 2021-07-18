class SearchRecipesService
  def self.search(search)
    if search != ""
      # マッチする材料の配列を取得
      ingredients = Ingredient.where('name LIKE(?)', "%#{search}%")
      ingredient_recipes = []
      ingredients.each do |ingredient|
        # 材料を使っている中間テーブルのレコードを取得
        recipe_ids = RecipeIngredient.where(ingredient_id: ingredient.id)
        ingredient_recipes.push(recipe_ids)
      end
      # 配列の中の配列をなくす
      ingredient_recipes.flatten!
      recipes_array = %w[]
      # idの順番
      ordered_recipes = []
      ingredient_recipes.each do |ingredient_recipe|
        # 中間テーブルのrecipe_idからRecipeのレコードを取得
        recipes = Recipe.where(id: ingredient_recipe.recipe_id)
        recipes_array.push(recipes)
        recipes.each do |recipe|
          ordered_recipes.push(recipe.id)
        end
      end
      # 配列の中の配列をなくす
      recipes_array.flatten!
      ordered_recipes = recipes_array.sort{|a,b| (-1)*(a <=> b)}
      return ordered_recipes
    else
      Recipe.where(publish_id: "1").order("created_at DESC")
    end
  end

  def self.incremental_search(search)
    return nil if search == ""
    # マッチする材料の配列を取得
    ingredients = Ingredient.where('name LIKE(?)', "%#{search}%")
  end

end