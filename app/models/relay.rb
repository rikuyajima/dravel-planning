class Relay < ApplicationRecord
  has_one_attached :image
  belongs_to :plan
end
