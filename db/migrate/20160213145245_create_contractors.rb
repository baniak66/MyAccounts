class CreateContractors < ActiveRecord::Migration
  def change
    create_table :contractors do |t|
      t.string :name
      t.string :address
      t.string :nip

      t.timestamps null: false
    end
  end
end
