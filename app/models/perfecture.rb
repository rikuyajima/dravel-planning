class Perfecture < ApplicationRecord
  has_many :plans, dependent: :destroy
  has_many :spots, dependent: :destroy
end
