class ApplicationController < ActionController::Base
  #before_filter :authenticate, :only => [:new]
  include PublicActivity::StoreController

  def authenticate
	 params[:key]
     params[:email]

     @authentication = Authentication.where(:email=>params[:email],:pass=>params[:key]).first

     if @authentication.nil?
     	redirect_to lv_path
     end   
  end

  protect_from_forgery
  def after_sign_in_path_for(resource)
    clients_path
  end

end
