class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # For additional Devise User attributes
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_filter :set_locale


  def after_sign_in_path_for(resource)
    current_user.wechat == nil || current_user.contact_email == nil || current_user.phone == nil ? edit_user_registration_path : root_path  
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :username) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:email, :password, :password_confirmation, :current_password, :username, :school, :major, :year_of_class, :bio, :wechat, :phone, :contact_email) }
  end
  # locales
  def set_locale
    I18n.locale = params[:locale] if params[:locale].present?
  end

  def default_url_options(options = {})
    {locale: I18n.locale}
  end
end
