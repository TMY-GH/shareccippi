class GroupInvitation < ApplicationRecord
# Association
  belongs_to :user
  belongs_to :group
end