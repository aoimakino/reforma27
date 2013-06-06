class ClientServicesController < ApplicationController
  before_filter :authenticate_admin!
  # GET /client_services
  # GET /client_services.json
  def index
    @client_services = ClientService.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @client_services }
    end
  end

  # GET /client_services/1
  # GET /client_services/1.json
  def show
    @client_service = ClientService.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @client_service }
    end
  end

  # GET /client_services/new
  # GET /client_services/new.json
  def new
    @client_service = ClientService.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @client_service }
    end
  end

  # GET /client_services/1/edit
  def edit
    @client_service = ClientService.find(params[:id])
  end

  # POST /client_services
  # POST /client_services.json
  def create
    @client_service = ClientService.new(params[:client_service])

    respond_to do |format|
      if @client_service.save
        format.html { redirect_to @client_service, notice: 'Client service was successfully created.' }
        format.json { render json: @client_service, status: :created, location: @client_service }
      else
        format.html { render action: "new" }
        format.json { render json: @client_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /client_services/1
  # PUT /client_services/1.json
  def update
    @client_service = ClientService.find(params[:id])

    respond_to do |format|
      if @client_service.update_attributes(params[:client_service])
        format.html { redirect_to @client_service, notice: 'Client service was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @client_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /client_services/1
  # DELETE /client_services/1.json
  def destroy
    @client_service = ClientService.find(params[:id])
    @client_service.destroy

    respond_to do |format|
      format.html { redirect_to client_services_url }
      format.json { head :no_content }
    end
  end
end
