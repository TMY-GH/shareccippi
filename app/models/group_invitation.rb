class GroupInvitation < ApplicationRecord
# Association
  belongs_to :user
  belongs_to :group
  # ユーザーIDとグループIDが同じ組み合わせは1つのみ
  validates_uniqueness_of :group_id, scope: :user_id
end