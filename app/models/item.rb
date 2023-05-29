class Item < ApplicationRecord
  has_one_attached :itemimage
  belongs_to :user
end
