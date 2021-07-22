class CreateStoreReservations < ActiveRecord::Migration[6.0]
  def change
    create_table :store_reservations do |t|
      t.datetime      :visit_date_time 
      t.references    :user 
      t.references    :foodstall
      t.timestamps
    end
  end
end
