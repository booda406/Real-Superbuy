class AddExportToOrders < ActiveRecord::Migration
  def change
  	add_column :orders, :export, :boolean
  end
end
