class Plan < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :content, presence: true
  has_many :plan_comments, dependent: :destroy
end
