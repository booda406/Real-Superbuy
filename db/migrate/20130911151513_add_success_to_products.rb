class AddSuccessToProducts < ActiveRecord::Migration
  def change
  	add_column :products, :success, :boolean
  	add_column :products, :count, :integer
  	add_column :products, :spot, :boolean
  	add_column :products, :janpan_price, :float
  	add_column :products, :taiwan_price, :float
  end
end
