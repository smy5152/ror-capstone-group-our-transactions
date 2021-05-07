class Task < ApplicationRecord
  validates :name, presence: true, length: { in: 6..50 }
  belongs_to :author, class_name: 'User'
end
