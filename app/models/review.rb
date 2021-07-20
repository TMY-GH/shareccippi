class Review < ApplicationRecord
# Association
  belongs_to :user
  belongs_to :recipe
  # ユーザーIDとレシピIDが同じ組み合わせは1つのみ
  validates_uniqueness_of :recipe_id, scope: :user_id

# Validation
  validates :difficulty, presence: true
  validates :difficulty, numericality: { :greater_than_or_equal_to => 1, :less_than_or_equal_to => 3, message: "が正しく選択されていません" }

# Method

end
