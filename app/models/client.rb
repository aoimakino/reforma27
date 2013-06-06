class Client < ActiveRecord::Base
 I18n.locale = 'es'
  #Activity Log
  include PublicActivity::Model
  tracked owner: ->(controller, model) { controller && controller.current_admin}

  attr_accessible :name, :email, :depto, :last_name, :phone, :status, :date, :patch, :date_modified, :payment_status
  has_many :client_services
  has_many :services, :through =>:client_services

  before_save { |client| client.email = email.downcase }

  def status_enum
    all_status = {1 => 'Active', 0 => 'Pending', 2 => 'Banned'}
    all_status.map{|key, val| [val, key]}
  end

  validates :name, presence: true, length: { maximum: 20 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true,
            format:     { with: VALID_EMAIL_REGEX }
  validates :depto, presence: true
  validates :last_name, presence: true
  validates :phone, presence: true, :numericality => {:only_integer => true}, length: { maximum: 10 }
  validates :status, presence: true



def self.send_mail_to

from = 'r27.kiwinetworks@gmail.com'
p = 'kiwiadmin'

content = <<EOF
From: 
To: 
subject: Notificacion Kiwinetworks
Date: #{Time.now.rfc2822}

hola

Puede descargar su factura en el siguiente link:

http://localhost:3000/clients/1.pdf

Saludos.
Kiwinetworks
EOF

Net::SMTP.enable_tls(OpenSSL::SSL::VERIFY_NONE)
Net::SMTP.start("smtp.gmail.com", "587", "gmail.com", from, p, :plain) do
 |smtp| smtp.send_message(content, from, 'geko727@gmail.com')
end
end


end

### boton para activities
### tratar de mostrar la actividad realizada