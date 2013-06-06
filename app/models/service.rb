class Service < ActiveRecord::Base
  attr_accessible :name, :price, :tax
  has_many :client_services
  has_many :clients, :through =>:client_services

end
