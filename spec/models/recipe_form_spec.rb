require 'rails_helper'

RSpec.describe RecipeForm, type: :model do
  describe 'レシピ新規投稿機能' do
    before do
      @recipe = FactoryBot.build(:recipe_form)
      @recipe.recipe_image = fixture_file_upload("/files/sample_recipe.jpeg")
      user = FactoryBot.create(:user)
      @recipe.user_id = user.id
    end
    context 'レシピの投稿成功' do
      it '全ての値が正常' do
        @recipe.valid?
        expect(@recipe).to be_valid
      end
      it '値段が空' do
        @recipe.price = nil
        @recipe.valid?
        expect(@recipe).to be_valid
      end
      it '注意書きが空' do
        @recipe.caution = nil
        @recipe.valid?
        expect(@recipe).to be_valid
      end
    end
    context 'レシピの投稿失敗' do
      it '料理名が空' do
        @recipe.recipe_name = nil
        @recipe.valid?
        expect(@recipe.errors.full_messages).to include("料理名を入力してください")
      end
      it '調理時間がない' do
        @recipe.minute = nil
        @recipe.valid?
        expect(@recipe.errors.full_messages).to include("調理時間を入力してください")
      end
      it '調理時間で---が選択されている' do
        @recipe.minute = "0"
        @recipe.valid?
        expect(@recipe.errors.full_messages).to include("調理時間は---以外を選択してください")
      end
      it '人数がない' do
        @recipe.serving = nil
        @recipe.valid?
        expect(@recipe.errors.full_messages).to include("人数を入力してください")
      end
      it '人数で---が選択されている' do
        @recipe.serving = "0"
        @recipe.valid?
        expect(@recipe.errors.full_messages).to include("人数は---以外を選択してください")
      end
      it '材料がない' do
        @recipe.ingredient_ids= nil
        @recipe.valid?
        expect(@recipe.errors.full_messages).to include("材料を入力してください")
      end
      it '材料で---が選択されている' do
        @recipe.ingredient_ids= ["1"]
        @recipe.valid?
        expect(@recipe.errors.full_messages).to include("材料(1つ目)が選択されていません")
        
        @recipe.ingredient_ids= ["6"]
        @recipe.valid?
        expect(@recipe.errors.full_messages).to include("材料(1つ目)が選択されていません")
        
        @recipe.ingredient_ids= ["22"]
        @recipe.valid?
        expect(@recipe.errors.full_messages).to include("材料(1つ目)が選択されていません")
        
        @recipe.ingredient_ids= ["30"]
        @recipe.valid?
        expect(@recipe.errors.full_messages).to include("材料(1つ目)が選択されていません")
        
        @recipe.ingredient_ids= ["35"]
        @recipe.valid?
        expect(@recipe.errors.full_messages).to include("材料(1つ目)が選択されていません")
      end
      it '材料の量がない' do
        @recipe.amounts= nil
        @recipe.valid?
        expect(@recipe.errors.full_messages).to include("材料の量を入力してください")
      end
      it '材料の量が数字でない' do
        @recipe.amounts= ["abc"]
        @recipe.valid?
        expect(@recipe.errors.full_messages).to include("材料の量（1つ目）には数字を入力してください")
      end
      it '調理方法がない' do
        @recipe.contents= nil
        @recipe.valid?
        expect(@recipe.errors.full_messages).to include("調理方法を入力してください")
      end
      it '公開設定がない' do
        @recipe.publish = nil
        @recipe.valid?
        expect(@recipe.errors.full_messages).to include("公開設定を入力してください")
      end
      it '公開設定で---が選択されている' do
        @recipe.publish = "0"
        @recipe.valid?
        expect(@recipe.errors.full_messages).to include("公開設定は---以外を選択してください")
      end
      it '調理難易度が選択されていない' do
        @recipe.difficulty = nil
        @recipe.valid?
        expect(@recipe.errors.full_messages).to include("調理難易度を入力してください")
      end
      it '調理難易度で１〜３以外が選択されている' do
        @recipe.difficulty = 4
        @recipe.valid?
        expect(@recipe.errors.full_messages).to include("調理難易度が正しく選択されていません")
      end
    end
    
  end
end