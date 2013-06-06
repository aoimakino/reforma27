class ClientsController < ApplicationController
 before_filter :authenticate_admin!, :only => [ :edit, :update, :destroy, :index]


  # GET /clients
  # GET /clients.json

  helper_method :sort_column, :sort_direction

  include ApplicationHelper
  def index
    @clients = Client.order(sort_column + " " + sort_direction)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @clients }
    end
  end

  def index_pagos
    @clients = Client.order(sort_column + " " + sort_direction)
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @clients }
    end
  end


  # GET /clients/1
  # GET /clients/1.json
  def show
    @client = Client.find(params[:id])
    #@client_services = ClientService.find(:all, :conditions => ['client_id = ?', @client.id])
    #@service = Service.find(:all, :conditions => ['id = ?', @client_services[0].service_id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @client }
      format.pdf do
        
        if @client.payment_status == "Pendiente"
        render :pdf => "file_name", :page_size => "Letter",
                :template => 'clients/show.pdf.erb',
                :layout => 'pdf'
        elsif @client.payment_status == "Atrasado"
           render :pdf => "file_name", :page_size => "Letter",
                :template => 'clients/atras.pdf.erb',
                :layout => 'pdf'
        else @client.payment_status == "Vencido"
                render :pdf => "file_name", :page_size => "Letter",
                :template => 'clients/vencido.pdf.erb',
                :layout => 'pdf'
        end
      end
    end
  end

  # GET /clients/new
  # GET /clients/new.json
  def new
    @client = Client.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @client }
    end
  end

  # GET /clients/1/edit
  def edit
    @client = Client.find(params[:id])
  end

  # POST /clients
  # POST /clients.json
  def create
    @client = Client.new(params[:client])

    respond_to do |format|
      if @client.save
        ClientService.create :client_id=>@client.id, :service_id =>'1'
        format.html { redirect_to gracias_path }
        format.json { render json: @client, status: :created, location: @client }
      require 'rubygems'
      require 'tlsmail'
      require 'time'

        send_mail_to(@client.email, "Gracias por contratar")

        @admins = Admin.all
        @admins.each do |admin|
        send_mail_to(admin.email, "Una nueva orden de servicio ha sido creada.

          Los datos del cliente son:

          Nombre: #{@client.name}

          Apellido: #{@client.last_name}

          Email: #{@client.email}

          Celular: #{@client.phone}
          
          Departamento: #{@client.depto}

          Fecha: #{@client.created_at.strftime('%m/%d/%Y')} ")
      end
     
      else
        format.html { render action: "new" }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  def send_admin
        send_mail_to(params[:email], "Clic aqui para crear tu cuenta: http://r27.kiwinetworks.com/admins/sign_up")
        redirect_to root_path
  end

 def send_sol
        @admins = Admin.all
        @admins.each do |admin|
        send_mail_to(admin.email, "The user email is #{params[:email]}") 
      end
        redirect_to root_path
  end

  # PUT /clients/1
  # PUT /clients/1.json
  def update
    @client = Client.find(params[:id])

    respond_to do |format|
      if @client.update_attributes(params[:client])
        format.html { redirect_to @client, notice: 'El registro fue actualizado correctamente.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end


def self.send_mail_month(client)

from = 'r27.kiwinetworks@gmail.com'
p = 'kiwiadmin'

content = <<EOF
From: 
To: 
subject: Notificacion Kiwinetworks
Date: #{Time.now.rfc2822}

Apreciable #{client.name} #{client.last_name}

Te informamos que a partir de este momento ya se encuentra disponible tu estado de cuenta del mes de #{I18n.localize (Time.now-1.month), :format => '%B'}
Para tener acceso a el da clic en el siguiente link:

http://r27.kiwinetworks.com/clients/#{client.id}.pdf


Saludos.
Kiwinetworks
EOF

Net::SMTP.enable_tls(OpenSSL::SSL::VERIFY_NONE)
Net::SMTP.start("smtp.gmail.com", "587", "gmail.com", from, p, :plain) do
 |smtp| smtp.send_message(content, from, client.email)
end
end

def self.primero_mes
    @clients = Client.all
    @clients.each do |client|
    case client.payment_status
      when "Pendiente"
        send_mail_month(client)
      when "Pagado" 
        client.payment_status = "Pendiente"
        client.save
        #send_mail_month(client)
     when "Vencido"
        send_mail_month(client)
      when  "Cancelado"
        client.payment_status = "Cancelado"
        client.save
      else 
        puts "else"
      end
    end
end

def self.diez_mes
    @clients = Client.all
    @clients.each do |client|
    case client.payment_status
      when "Pendiente"
        client.payment_status = "Atrasado"
        client.save
        send_mail_month(client)
      when "Pagado" 
        client.payment_status = "Pagado"
        client.save
     when "Vencido"
        send_mail_month(client)
      when  "Cancelado"
        client.payment_status = "Cancelado"
        client.save
      else 
        puts "else"
      end
    end
end

def self.quince_mes
    @clients = Client.all
    @clients.each do |client|
    case client.payment_status
      when "Atrasado"
        client.payment_status = "Vencido"
        client.save
        send_mail_month(client)
      when "Pagado" 
        client.payment_status = "Pagado"
        client.save
     when "Vencido"
        send_mail_month(client)
      when  "Cancelado"
        client.payment_status = "Cancelado"
        client.save
      else 
        puts "else"
      end
    end
end









  # DELETE /clients/1
  # DELETE /clients/1.json
  def destroy
    @client = Client.find(params[:id])
    @client.destroy

    respond_to do |format|
      format.html { redirect_to clients_url }
      format.json { head :no_content }
    end
  end

  private

  def sort_column
    Client.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
