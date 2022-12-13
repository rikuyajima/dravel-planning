class Relay < ApplicationRecord
  has_one_attached :image
  belongs_to :plan
  validates :relay_point, presence: true, length: { maximum: 30 }
  validates :point_introduction, {presence: true, length: {maximum: 140}}

  def get_image(width, height)
  unless image.attached?
    file_path = Rails.root.join('app/assets/images/noimage.png')
    image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
  end
    image.variant(resize_to_limit: [width, height]).processed
  end
end
