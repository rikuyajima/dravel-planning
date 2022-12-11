class SpotComment < ApplicationRecord
  belongs_to :user
  belongs_to :spot
  validates :comment, {presence: true, length: {maximum: 140}}
end
