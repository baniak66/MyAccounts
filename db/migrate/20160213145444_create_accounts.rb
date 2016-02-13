class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :number
      t.string :accounttype

      t.timestamps null: false
    end
  end
end
