class Recipe < ApplicationRecord
  belongs_to :user
  has_one_attached :image

# ActiveHash
  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :time
    belongs_to :serving
    belongs_to :publish

# Validation
  with_options presene: true do
    validates :name
    validates :time_id
    validates :serving_id
    validates :publish_id
    validates :price
    validates :image
  end

end