class Genre < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '俯瞰夜景' },
    { id: 3, name: '郊外・住宅街夜景' },
    { id: 4, name: 'ウォーターフロント夜景' },
    { id: 5, name: '都会・都市夜景' },
    { id: 6, name: '工場夜景' },
    { id: 7, name: 'イルミネーション' },
    { id: 8, name: 'ライトアップ夜景' },
    { id: 9, name: '道路・橋夜景' },
    { id: 10, name: '夕景' },
    { id: 11, name: '星空' },
    { id: 12, name: '花火' },
    { id: 13, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :nights
end