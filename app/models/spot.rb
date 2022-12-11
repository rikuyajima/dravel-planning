class Spot < ApplicationRecord
  has_many_attached :images
  belongs_to :perfecture
  belongs_to :user
  has_many :spot_comments, dependent: :destroy
  validates :address, presence: true
  validates :lat, presence: true
  validates :lng, presence: true
  validate :image_length

  enum status: { 審査中: 0, 承認: 1}

  def image_length
    if images.length > 4
      images.purge
      errors.add(:images, "は4枚以内にしてください")
    end
  end

  def self.looks(search, word)
    if search == "perfect_match"
      @search_spots = Spot.where("id or address  LIKE?","#{word}")
    elsif search == "partial_match"
      @search_spots = Spot.where("id or address LIKE?","%#{word}%")
    else
      @search_spots = Spot.all
    end
  end
end
