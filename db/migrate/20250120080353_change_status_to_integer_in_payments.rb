class ChangeStatusToIntegerInPayments < ActiveRecord::Migration[7.2]
  def change
    change_column :payments, :status, :integer, using: 'status::integer'
  end
end
