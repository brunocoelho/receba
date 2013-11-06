class CreateTransfers < ActiveRecord::Migration
  def change
    create_table :transfers do |t|
      t.integer :user_id
      t.integer :receiver_id
      t.decimal :amount, precision: 8, scale: 2
      t.string :email
      t.string :name
      t.boolean :success
      t.integer :transaction_id

      t.timestamps
    end
  end
end