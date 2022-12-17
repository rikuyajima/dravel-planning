class Contact < ApplicationRecord
  belongs_to :user
  
  validates :kinds, presence: true
  validates :subject, presence: true, length: { maximum: 30 }
  validates :message, presence: true

  enum kinds: { ご意見、ご要望: 0, スポット申請却下について: 1, バグ報告: 2, その他: 3}
  enum contact_status: { 対応中: 0, 回答済: 1}
end
