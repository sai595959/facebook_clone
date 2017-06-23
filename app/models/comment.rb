class Comment < ActiveRecord::Base

  validates :content, presence: true, length: {maximum: 140}

  belongs_to :user
  belongs_to :topic

  has_many :notifications, dependent: :destroy
end
