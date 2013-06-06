class Authentication < ActiveRecord::Base
  attr_accessible :email, :pass
end
