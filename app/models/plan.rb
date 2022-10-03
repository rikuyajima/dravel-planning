class Plan < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :relays, dependent: :destroy
  accepts_nested_attributes_for :relays, allow_destroy: true ##cocoonを導入。relayを保存する
end
