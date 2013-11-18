class CreateTransfers < ActiveRecord::Migration
  def change
    create_table :transfers do |t|
      t.integer :user_id
      t.integer :receiver_id, null: false
      t.decimal :amount, precision: 8, scale: 2
      t.string :email, null: false
      t.string :name, null: false
      t.boolean :success
      t.integer :transaction_id

      t.string :ip_address, null: false
      t.string :location

      t.timestamps
    end
  end
end