class AddAcceptToEvidences < ActiveRecord::Migration
  def change
    add_column :evidences, :accept, :boolean, default: false
  end
end
