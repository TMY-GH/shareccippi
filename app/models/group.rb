class Group < ApplicationRecord
# Association
  has_many :user_groups
  has_many :users, through: :user_groups
  belongs_to :owner, source: :user
  # has_many :group_likes
  # has_many :recipes, through: :group_likes

# Validation
  validates :name, presence: true
end
