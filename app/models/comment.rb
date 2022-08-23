class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :night

  validates :content,presence: true
end
