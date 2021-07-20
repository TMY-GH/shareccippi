class Review < ApplicationRecord
# Association
  belongs_to :user
  belongs_to :recipe
  # ユーザーIDとレシピIDが同じ組み合わせは1つのみ
  validates_uniqueness_of :recipe_id, scope: :user_id
end
