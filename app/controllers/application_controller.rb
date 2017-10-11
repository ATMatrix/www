class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  layout :layout_by_resource

  before_filter :set_locale
  before_filter :blog_switch

  def set_locale
    session[:locale] = params[:locale] if params[:locale]
    session[:locale] = nil unless %w(zh-CN en).include?(session[:locale])
    I18n.locale = session[:locale] || I18n.default_locale
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.root_path, :alert => exception.message
  end

  protected

  # disable blog post for now
  def blog_switch
    @show_blog = false
  end

  def layout_by_resource
    if devise_controller?
      "devise"
    else
      "application"
    end
  end


  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end

end