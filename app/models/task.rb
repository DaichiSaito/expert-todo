class Task < ApplicationRecord
  belongs_to :user # 一人のユーザーに紐づく。
  validates :content, presence: true
  has_many :attachments, dependent: :destroy
end
