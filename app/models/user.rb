class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

# --- バリデーション ---
  with_options presence: true do
    validates :nick_name
    validates :user_name
  end
end
