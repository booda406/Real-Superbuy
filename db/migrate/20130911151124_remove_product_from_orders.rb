class RemoveProductFromOrders < ActiveRecord::Migration
  def change
  	remove_column :orders, :product 
  	remove_column :orders, :description
  	remove_column :orders, :count
  	remove_column :orders, :spot
  	remove_column :orders, :japanprice
  	remove_column :orders, :taiwanprice
  end
end
