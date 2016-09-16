class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  include ActionController::RequestForgeryProtection
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session, only: Proc.new { |c| c.request.format.json? }

  before_action :configure_permitted_parameters, if: :devise_controller?

  before_action :what



  protected

  def what
    p params
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email,:password,:password_confirmation, :name, :provider, :uid])
  end



end
