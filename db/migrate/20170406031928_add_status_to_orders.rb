class AddStatusToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :status, :string, :default => "new"
  end
end
