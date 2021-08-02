class Group < ApplicationRecord
# Association
  has_many :user_groups, dependent: :destroy
  has_many :users, through: :user_groups
  has_one :group_owner, dependent: :destroy
  has_one :owner, through: :group_owner, source: :user, dependent: :destroy
  has_many :group_invitations, dependent: :destroy
  has_many :invited_users, through: :group_invitations, source: :user, dependent: :destroy
  has_many :group_likes, dependent: :destroy
  has_many :recipes, through: :group_likes
  has_one :group_shopping, dependent: :destroy

# Validation
  validates :name, presence: true
end
