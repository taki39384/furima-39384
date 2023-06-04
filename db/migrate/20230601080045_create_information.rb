class CreateInformation < ActiveRecord::Migration[6.0]
  def change
    create_table :information do |t|
      t.string     :post_code,           null: false
      t.string     :municipalities,      null: false
      t.string     :address,             null: false
      t.string     :building_name
      t.string     :number,              null: false
      t.integer    :region_of_origin_id, null: false
      t.references :order,               null: false, foreign_key: true 

      t.timestamps
    end
  end
end
