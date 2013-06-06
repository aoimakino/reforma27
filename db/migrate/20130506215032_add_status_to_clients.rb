class AddStatusToClients < ActiveRecord::Migration
  def change
    add_column :clients, :status, :string
    add_column :clients, :date, :date
  end
end
