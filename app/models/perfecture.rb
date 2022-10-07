class Perfecture < ApplicationRecord
  has_many :plans, dependent: :destroy
end
