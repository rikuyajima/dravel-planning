class SpotComment < ApplicationRecord
  belongs_to :user
  belongs_to :spot
  has_many_attached :spot_images
  validates :comment, {presence: true, length: {maximum: 140}}

  def spot_image_length
    if spot_images.length > 2
      spot_images.purge
      errors.add(:spot_images, "は2枚以内にしてください")
    end
  end
end
