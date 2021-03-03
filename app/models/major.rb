class Major < ActiveHash::Base
  
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '地質' },
    { id: 3, name: '生物' },
    { id: 4, name: '物理' },
    { id: 5, name: '天文' },
    { id: 6, name: '火山' },
    { id: 7, name: '地球科学' },
    { id: 8, name: '河川' },
    { id: 9, name: '地形' },
    { id: 10, name: '農業' },
    { id: 11, name: '植生' },
    { id: 12, name: '考古' },
    { id: 13, name: '人文' },
    { id: 14, name: '歴史' },
    { id: 15, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :users
  
end