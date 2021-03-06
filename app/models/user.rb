class User < ApplicationRecord
# --- アソシエーション ---
  has_many :recipes
  has_many :user_likes
  has_many :favorites, through: :user_likes, source: :recipe
  has_many :reviews
  
  has_many :user_groups
  has_many :groups, through: :user_groups
  has_many :group_owners
  has_many :own_groups, through: :group_owners, source: :group
  has_many :group_invitations
  has_many :invited_groups, through: :group_invitations, source: :group
  
# --- バリデーション ---
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable,
          :authentication_keys => [:user_name]

  # case_sensitiveはRSpecテスト用
  with_options presence: true, uniqueness: { case_sensitive: true } do
    validates :nick_name
    validates :user_name
  end

  validates :user_name, format: { with: /\A[a-zA-Z\d]{4,16}\z/i, message: "が正しくありません"}

# --- Method ---
  
# 投稿者本人と既にレビューした人はコメントできません
  def commentable?(recipe)
    if self.reviews.exists?(recipe_id: recipe[:id])
      return false
    elsif recipe.user.id == self.id
      return false
    else
      return true
    end
  end

  # お気に入り済みか判断
  def already_liked?(recipe)
    self.user_likes.exists?(recipe_id: recipe[:id])
  end

  # Remember_meを常にTrue
  def remember_me
    true
  end
  #usernameを利用してログインするようにオーバーライド
  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      #認証の条件式を変更する
      where(conditions).where(["username = :value", { :value => user_name }]).first
    else
      where(conditions).first
    end
  end
# メールアドレスを使わない設定
  def email_required?
    false
  end
  def email_changed?
    false
  end
  def will_save_change_to_email?
    false
  end
end
