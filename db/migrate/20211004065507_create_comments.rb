class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :foodstall_id
      #t.float :rate, null: false
      t.text :text, null: false
      t.timestamps
    end
  end
end
