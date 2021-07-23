class Group < ApplicationRecord
# Association
  has_many :user_groups, dependent: :destroy
  has_many :users, through: :user_groups
  has_one :group_owner, dependent: :destroy
  has_one :owner, through: :group_owner, source: :user
  has_many :group_invitations, dependent: :destroy
  has_many :invited_users, through: :group_invitations, source: :user
  # has_many :group_likes
  # has_many :recipes, through: :group_likes

# Validation
  validates :name, presence: true
end
