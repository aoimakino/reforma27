class AddPaymentStatusToClients < ActiveRecord::Migration
  def change
    add_column :clients, :payment_status, :string
  end
end
