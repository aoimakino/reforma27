class ClientService < ActiveRecord::Base
  attr_accessible :client_id, :service_id
  belongs_to :client
  belongs_to :service
end
