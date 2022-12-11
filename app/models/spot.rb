class Spot < ApplicationRecord
  has_many_attached :images
  belongs_to :perfecture
  belongs_to :user
  has_many :spot_comments, dependent: :destroy
  validates :address, presence: true
  validates :lat, presence: true
  validates :lng, presence: true
  validate :image_length

  def image_length
    if images.length > 4
      images.purge
      errors.add(:images, "は4枚以内にしてください")
    end
  end
end
