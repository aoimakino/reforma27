class Admin < ActiveRecord::Base
  #Activiyt log
  include PublicActivity::Model
  #tracked owner: ->(controller, model) { controller && controller.current_admin}

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :password, :password_confirmation, :remember_me
  attr_accessible :email, :last_name, :name

  before_save { |admin| admin.email = email.downcase }

  #validates :name, presence: true, length: { maximum: 20 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true, uniqueness: true, 
            format:     { with: VALID_EMAIL_REGEX } 

  #validates :last_name, presence: true
  validates :password, presence: true, length: { minimum: 6 }

end
