class GroupLike < ApplicationRecord
  belongs_to :group
  belongs_to :recipe
end
