class AddDecreetypeToDecrees < ActiveRecord::Migration
  def change
    add_column :decrees, :decreetype, :string
    remove_column :decrees, :decrretype, :string
  end
end
