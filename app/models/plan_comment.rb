class PlanComment < ApplicationRecord
  belongs_to :user
  belongs_to :plan
  validates :comment, {presence: true, length: {maximum: 140}}
end
