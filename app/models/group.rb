class Group < ApplicationRecord
  belongs_to :user, class_name: "User"
  has_one_attached :icon
end
