class Night < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one_attached :image
  belongs_to :genre
  belongs_to :state

  validates :title,presence: true 
  validates :explain,presence: true
  validates :image,presence: true

  validates :genre_id, numericality: { other_than: 1 }
  validates :state_id, numericality: { other_than: 1 }

end
