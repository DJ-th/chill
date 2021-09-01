class CreateStoreReservations < ActiveRecord::Migration[6.0]
  def change
    create_table :store_reservations do |t|
      t.datetime      :visit_date_time 
      t.references    :user 
      t.references    :foodstall
      t.string        :name,             null: false
      t.string        :email,              null: false
      t.string        :phone_number,          null: false
      t.timestamps
    end
  end
end
