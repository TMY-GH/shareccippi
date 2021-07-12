class Serving < ActiveHash::Base
  include ActiveHash::Associations
    has_many :recipes
  
  self.data = [
    { id: 0, people: '---' },
    { id: 1, people: '1' },
    { id: 2, people: '2' },
    { id: 3, people: '3' },
    { id: 4, people: '4' },
    { id: 5, people: '5' },
    { id: 6, people: '6' },
    { id: 7, people: '7' },
    { id: 8, people: '8' },
    { id: 9, people: '9' },
    { id: 10, people: '10' },
    { id: 11, people: '15' },
    { id: 12, people: '20' }
  ]
end