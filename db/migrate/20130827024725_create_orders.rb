class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :email
      t.float :exchange_rate
      t.float :fare
      t.float :fee
      t.string :product
      t.string :description
      t.integer :count
      t.boolean :spot
      t.float :japanprice
      t.float :taiwanprice
      t.float :totalprice
      t.string :bank_name
      t.string :bank_account

      t.timestamps
    end
  end
end
