class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :profile_image
  has_many :plans, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorited_posts, through: :favorites, source: :post
  has_many :plan_comments, dependent: :destroy
  has_many :view_counts, dependent: :destroy

  validates :name, presence: true, length: { maximum: 20 }
  validates :profile, length: { maximum: 200 }
 
 #検索
  def self.looks(search, word)
    if search == "perfect_match"
      @search_users = User.where("name or id LIKE?", "#{word}")
    elsif search == "partial_match"
      @search_users = User.where("name or id LIKE?","%#{word}%")
    else
      @search_users = User.all
    end
  end

  def get_profile_image
    if profile_image.attached?
      profile_image
    else
      file_path = Rails.root.join('app/assets/images/noimage.png')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
  end
  
  #ゲストログイン
  def self.guest
    find_or_create_by!(name: 'guestuser' ,email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "guestuser"
    end
  end

  #退会後同じアカウントでログインできないようにする
  def active_for_authentication?
    super && (is_deleted == false)
  end
end

