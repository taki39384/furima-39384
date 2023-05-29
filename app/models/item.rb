class Item < ApplicationRecord
  has_one_attached :itemimage
  belongs_to :user

  validates :name, presence: true
  validates :category_id, presence: true, numericality: { only_integer: true }
  validates :explanation, presence: true
  validates :situation_id, presence: true, numericality: { only_integer: true }
  validates :delivery_charge_id, presence: true, numericality: { only_integer: true }
  validates :region_of_origin_id, presence: true, numericality: { only_integer: true }
  validates :day_to_ship_id, presence: true, numericality: { only_integer: true }
  validates :price, presence: true, numericality: { only_integer: true }
  validates :user, presence: true
end
