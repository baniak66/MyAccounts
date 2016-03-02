class AddBalancesToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :dt_opening, :float, default: 0.0
    add_column :accounts, :ct_opening, :float, default: 0.0
  end
end
