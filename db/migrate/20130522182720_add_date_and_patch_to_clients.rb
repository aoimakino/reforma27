class AddDateAndPatchToClients < ActiveRecord::Migration
  def change
    add_column :clients, :patch, :string
    add_column :clients, :date_modified, :string
  end
end
