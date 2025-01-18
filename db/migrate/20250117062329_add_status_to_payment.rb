class AddStatusToPayment < ActiveRecord::Migration[7.2]
  def change
    add_column :payments, :status, :boolean
  end
end
