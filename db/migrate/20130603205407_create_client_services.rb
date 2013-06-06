class CreateClientServices < ActiveRecord::Migration
  def change
    create_table :client_services do |t|
      t.string :client_id
      t.string :service_id

      t.timestamps
    end
  end
end
