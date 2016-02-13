class CreateEvidences < ActiveRecord::Migration
  def change
    create_table :evidences do |t|
      t.string :number
      t.date :madedate
      t.float :amount
      t.string :description
      t.references :contractor, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
