class Plan < ApplicationRecord
  has_one_attached :image
  has_one_attached :start_image
  has_one_attached :gole_image

  belongs_to :perfecture
  belongs_to :user
  has_many :relays, inverse_of: :plan, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorited_users, through: :favorites, source: :user
  has_many :plan_comments, dependent: :destroy
  has_many :view_counts, dependent: :destroy

  validates :start, presence: true, length: { maximum: 30 }
  validates :situation, presence: true
  validates :gole, presence: true, length: { maximum: 30 }
  validates :start_introduction, {presence: true, length: {maximum: 140}}
  validates :gole_introduction, {presence: true, length: {maximum: 140}}
   ##cocoonを導入。relayを保存する
  accepts_nested_attributes_for :relays, allow_destroy: true

  def self.looks(search, word)
    if search == "perfect_match"
      @search_plans = Plan.where("start LIKE?","#{word}")
    elsif search == "partial_match"
      @search_plans = Plan.where("start LIKE?","%#{word}%")
    else
      @search_plans = Plan.all
    end
  end

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end


  def get_start_image(width, height)
  unless start_image.attached?
    file_path = Rails.root.join('app/assets/images/noimage.png')
    start_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
  end
    start_image.variant(resize_to_limit: [width, height]).processed
  end

  def get_gole_image(width, height)
  unless gole_image.attached?
    file_path = Rails.root.join('app/assets/images/noimage.png')
    gole_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
  end
    gole_image.variant(resize_to_limit: [width, height]).processed
  end
end
