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
      @recipes = []
      ingredient_recipes.each do |recipe|
        # 中間テーブルのrecipe_idからRecipeのレコードを取得
        @recipes.push(Recipe.where(id: recipe.recipe_id))
      end
      # 配列の中の配列をなくす
      @recipes.flatten!
      return @recipes
    else
      Recipe.where(publish_id: "1")
    end
  end
end