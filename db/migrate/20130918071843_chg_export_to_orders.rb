class ChgExportToOrders < ActiveRecord::Migration
  def change
  	change_column :orders, :export, :boolean, :default => false
  end
end
