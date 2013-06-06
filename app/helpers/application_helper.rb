module ApplicationHelper

def sortable(column, title = nil)
   title ||= column.titleize
   css_class = column == sort_column ? "current #{sort_direction}" : nil
   direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
   link_to title, {:sort => column, :direction => direction}, {:class => css_class}
end

def send_mail_to(to,contents)

from = 'r27.kiwinetworks@gmail.com'
p = 'kiwiadmin'

content = <<EOF
From: #{from}
To: #{to}
subject: Notificacion Kiwinetworks
Date: #{Time.now.rfc2822}

#{contents}

Saludos.
Kiwinetworks
EOF

Net::SMTP.enable_tls(OpenSSL::SSL::VERIFY_NONE)
Net::SMTP.start("smtp.gmail.com", "587", "gmail.com", from, p, :plain) do
 |smtp| smtp.send_message(content, from, to)
end
end

def receive_messages
  Net::POP.enable_ssl(OpenSSL::SSL::VERIFY_NONE)
  Net::POP.start("pop.gmail.com", "995", "r27.kiwinetworks@gmail.com", "kiwiadmin") do |pop|
    p pop.mails[0].pop
  end
end
end
