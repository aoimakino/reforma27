class ChangeClientIdType < ActiveRecord::Migration
  def up
  	change_column :client_services, :client_id, :integer
  	change_column :client_services, :service_id, :integer
  end

  def down
  	change_column :client_services, :client_id, :string
  	change_column :client_services, :service_id, :string
  end
end
