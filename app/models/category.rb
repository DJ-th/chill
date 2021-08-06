class Category < ActiveHash::Base
  self.data = [
    # { id: 1, name: '指定なし' },
    { id: 1, name: 'カフェ' },
    { id: 2, name: 'シーシャ' },
    { id: 3, name: '居酒屋' },
  ]
  include ActiveHash::Associations
  has_many :foodstalls
end