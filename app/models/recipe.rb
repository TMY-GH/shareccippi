class Recipe < ApplicationRecord
  before_create :default_image
# Association
  belongs_to :user
  
  has_one_attached :image, dependent: :destroy
  has_many :recipe_ingredients, dependent: :destroy
  has_many :ingredients, through: :recipe_ingredients
  has_many :cookings, dependent: :destroy

  has_many :user_likes
  has_many :users, through: :user_likes

# ActiveHash
  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :minute
    belongs_to :serving
    belongs_to :publish

# --- Method ---

  # 料理の写真がない場合、初期画像の追加
  def default_image
    if !self.image.attached?
      self.image.attach(io: File.open(Rails.root.join('public', 'images', 'default_recipe_image.jpg')), filename: 'default_recipe_image.jpg', content_type: 'image/jpg')
    end
  end
end
