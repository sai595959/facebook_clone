class Topic < ActiveRecord::Base
  validates :content, presence: true, length: {maximum: 140}
  belongs_to :user
  has_many :comments, dependent: :destroy

  mount_uploader :photo, PhotoUploader
end
