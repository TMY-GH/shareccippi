class GroupLike < ApplicationRecord
  belongs_to :group
  belongs_to :recipe
  # ユーザーIDとレシピIDが同じ組み合わせは1つのみ
  validates_uniqueness_of :recipe_id, scope: :group_id
end
