class User < ApplicationRecord
  validates :name, presence: true, length: { in: 6..10 }
  has_one_attached :avatar

  has_many :groups
  has_many :tasks
end
