class Weather < ActiveHash::Base

  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '快晴' },
    { id: 3, name: '晴れ' },
    { id: 4, name: '曇り' },
    { id: 5, name: '小雨' },
    { id: 6, name: '雨' },
    { id: 7, name: 'やや大雨' },
    { id: 8, name: '大雨・豪雨' },
    { id: 9, name: '雷雨' },
    { id: 10, name: '台風' },
    { id: 11, name: 'みぞれ' },
    { id: 12, name: 'あられ' },
    { id: 13, name: '雪' },
    { id: 14, name: '大雪' },
    { id: 15, name: 'その他' }
  ]
  include ActiveHash::Associations
  has_many :articles
  
end