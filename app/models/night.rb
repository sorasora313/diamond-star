class Night < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image
  belongs_to :genre
  belongs_to :state
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  def liked_by?(user)
      likes.exists?(user_id: user.id)
  end


  validates :title,presence: true 
  validates :explain,presence: true
  validates :image,presence: true

  validates :genre_id, numericality: { other_than: 1 }
  validates :state_id, numericality: { other_than: 1 }

end
