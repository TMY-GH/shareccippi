class IngredientGenre < ActiveHash::Base
  include ActiveHash::Associations
    has_many :ingredients
  
  self.data = [
    { id: 0, genre: '---' },
    { id: 1, genre: '肉' },
    { id: 2, genre: '---' },
    { id: 3, genre: '野菜' },
    { id: 4, genre: '---' },
    { id: 5, genre: '卵・乳製品' },
    { id: 6, genre: '---' },
    { id: 7, genre: '米・パン' },
    { id: 8, genre: '---' },
    { id: 9, genre: '調味料' }
  ]
end
