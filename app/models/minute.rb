class Minute < ActiveHash::Base
  include ActiveHash::Associations
    has_many :recipes
  
  self.data = [
    { id: 0, time: '---' },
    { id: 1, time: '5' },
    { id: 2, time: '10' },
    { id: 3, time: '20' },
    { id: 4, time: '30' },
    { id: 5, time: '40' },
    { id: 6, time: '50' },
    { id: 7, time: '60' },
    { id: 8, time: '70' },
    { id: 9, time: '80' },
    { id: 10, time: '90' },
    { id: 11, time: '120' },
    { id: 12, time: '150' },
    { id: 13, time: '180' }
  ]
end
