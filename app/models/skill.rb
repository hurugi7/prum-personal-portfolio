class Skill < ApplicationRecord
  belongs_to :user
  belongs_to :category
  validates :user_id, presence: true
  validates :category_id, presence: true
  validates :name, presence: true, length: { maximum: 30 }
  validates :level, presence: true
end
