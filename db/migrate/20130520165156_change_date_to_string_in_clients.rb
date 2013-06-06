class ChangeDateToStringInClients < ActiveRecord::Migration
  def up
    change_column :clients, :date, :string
  end

  def down
    change_column :clients, :date, :date
  end
end
