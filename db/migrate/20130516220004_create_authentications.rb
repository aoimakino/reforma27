class CreateAuthentications < ActiveRecord::Migration
  def change
    create_table :authentications do |t|
      t.string :email
      t.string :pass

      t.timestamps
    end
  end
end