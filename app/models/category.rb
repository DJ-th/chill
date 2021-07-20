class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'カフェ' },
    { id: 3, name: 'シーシャ' },
    { id: 4, name: '居酒屋' },
  ]
  include ActiveHash::Associations
  has_many :foodstalls
end