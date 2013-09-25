class RenameBankCodeToOrders < ActiveRecord::Migration
  def change
  	rename_column :sellers, :bank_code, :bank_username
  end
end
