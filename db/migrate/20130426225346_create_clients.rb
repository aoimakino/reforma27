class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.string :last_name
      t.string :email
      t.integer :phone
      t.string :depto
      t.timestamps
    end
  end
end
