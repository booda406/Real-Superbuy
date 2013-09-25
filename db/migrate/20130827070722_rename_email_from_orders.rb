class RenameEmailFromOrders < ActiveRecord::Migration
  def change
  	rename_column :orders, :email, :contact
  end
end
