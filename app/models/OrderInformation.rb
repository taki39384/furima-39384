class OrderInformation
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :region_of_origin_id, :municipalities, :address, :building_name, :number, :order

  # ここにバリデーションの処理を書く
  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code
    validates :region_of_origin_id
    validates :municipalities
    validates :address
    validates :number
    
  end

  def save
    # 各テーブルにデータを保存する処理を書く
    order = Order.create(user_id: user_id, item_id: item_id)
    Information.create(post_code: post_code, region_of_origin_id: region_of_origin_id, municipalities: municipalities, address: address, building_name: building_name, number: number, order_id: order.id)
  end
end