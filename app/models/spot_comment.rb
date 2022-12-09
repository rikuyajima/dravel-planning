class SpotComment < ApplicationRecord
  belongs_to :user
  belongs_to :spot
  validates :comment, {presence: true, length: {maximum: 140}}
  validates :rate, numericality: {
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 1}, presence: true
end
