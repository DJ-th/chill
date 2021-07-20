class Prefecture < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '東京' },
    { id: 3, name: '関東' },
    { id: 4, name: '北海道' },
    { id: 5, name: '東北' },
    { id: 6, name: '中部' },
    { id: 7, name: '近畿' },
    { id: 8, name: '中国' },
    { id: 9, name: '四国' },
    { id: 10, name: '九州' },
    { id: 11, name: '沖縄'},
  ]
  include ActiveHash::Associations
  has_many :foodstalls
end