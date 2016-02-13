class CreateDecrees < ActiveRecord::Migration
  def change
    create_table :decrees do |t|
      t.string :decrretype
      t.float :amount
      t.references :evidence, index: true, foreign_key: true
      t.references :account, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
