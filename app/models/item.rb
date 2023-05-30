class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :situation
  belongs_to :delivery_charge
  belongs_to :region_of_origin
  belongs_to :day_to_ship
  has_one_attached :itemimage
  belongs_to :user


  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :category_id, presence: true, numericality: { only_integer: true }
    validates :situation_id, presence: true, numericality: { only_integer: true }
    validates :delivery_charge_id, presence: true, numericality: { only_integer: true }
    validates :region_of_origin_id, presence: true, numericality: { only_integer: true }
    validates :day_to_ship_id, presence: true, numericality: { only_integer: true }
  end

  validates :name, presence: true
  validates :itemimage, presence: true
  validates :category_id, presence: true, numericality: { only_integer: true }
  validates :explanation, presence: true
  validates :situation_id, presence: true, numericality: { only_integer: true }
  validates :delivery_charge_id, presence: true, numericality: { only_integer: true }
  validates :region_of_origin_id, presence: true, numericality: { only_integer: true }
  validates :day_to_ship_id, presence: true, numericality: { only_integer: true }
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
end
