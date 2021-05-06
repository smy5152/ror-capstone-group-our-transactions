class User < ApplicationRecord
  has_one_attached :avatar
  has_many :groups
  has_many :tasks
end
