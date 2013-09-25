class ApplicationController < ActionController::Base
 before_action :configure_permitted_parameters, if: :devise_controller?
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  protected

  def configure_permitted_parameters
  	devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :email, :password, :password_confirmation, :current_password, :phone, :years, :store, :logo, :about, :bank, :bank_branch, :bank_username, :account)}
  	devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :email, :password, :password_confirmation, :current_password, :phone, :years, :store, :logo, :about, :bank, :bank_branch, :bank_username, :account)}
  end

  private

  def after_sign_in_path_for(resource)
      if resource.kind_of? Seller
      orders_path(:store => resource.store)
    end
  end

  def after_sign_out_path_for(resource_or_scope)
  		welcome_path
	end
end