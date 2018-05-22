class Task < ApplicationRecord
  belongs_to :user # 一人のユーザーに紐づく。
  validates :content, presence: true
  has_many :attachments, dependent: :destroy
  accepts_nested_attributes_for :attachments, allow_destroy: true#, reject_if: :all_blank
end
