class UserGroup < ApplicationRecord
# Association
  belongs_to :user
  belongs_to :group
end
