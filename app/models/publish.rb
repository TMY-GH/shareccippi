class Publish < ActiveHash::Base
  include ActiveHash::Associations
    has_many :recipes
  
  self.data = [
    { id: 0, publish: '---' },
    { id: 1, publish: '公開' },
    { id: 2, publish: '非公開' }
  ]
end