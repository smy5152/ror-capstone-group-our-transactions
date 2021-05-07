class Group < ApplicationRecord
  validates :name, presence: true, length: { in: 6..20 }
  belongs_to :user, class_name: 'User',
  has_one_attached :icon
end
