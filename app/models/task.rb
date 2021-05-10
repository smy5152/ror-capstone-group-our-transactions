class Task < ApplicationRecord
  validates :name, presence: true, length: { in: 6..50 }
  validates :amount, presence: true, numericality: true

  belongs_to :author, class_name: 'User'
  belongs_to :group, optional: true
  has_many :groups

  default_scope -> { order(created_at: :desc) }
  scope :ascending, -> { order(name: :asc) }
end
