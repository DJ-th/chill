class CreateFoodstalls < ActiveRecord::Migration[6.0]
  def change
    create_table :foodstalls do |t|
      t.integer    :category_id,           null: false
      t.string     :shop_name,             null: false
      t.string     :post_code,             null: false
      t.integer    :prefecture_id,         null: false
      t.string     :city_name,             null: false
      t.string     :address,               null: false
      t.string     :building_name,         null: false          
      t.string     :phone_number,          null: false
      t.string     :title,                 null: false
      t.string     :text,                  null: false
      t.references :owner,                 foreign_key: true
      t.timestamps
    end
  end
end
