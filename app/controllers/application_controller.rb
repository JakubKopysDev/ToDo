class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  # add action to before_filter :disable_header to disable header.
  def disable_header
    @disable_header = true
  end

  protected

  def configure_permitted_parameters
    attrs = [:name, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: attrs
    devise_parameter_sanitizer.permit :sign_in, keys: attrs
  end
end
