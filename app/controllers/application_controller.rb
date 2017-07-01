class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_locale
  before_action :configure_permitted_parameters, if: :devise_controller?

  def set_locale
    if params[:locale] && I18n.available_locales.include?( params[:locale].to_sym )
      session[:locale] = params[:locale]
    end
    I18n.locale = session[:locale] || I18n.default_locale
  end

	protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password, :is_female, :date_of_birth, :avatar) }
  end

  def admin_required
    if !current_user.admin?
      redirect_to '/', alert: "You're not admin!"
    end
  end

  helper_method :current_cart

  def current_cart
    @current_cart ||= find_cart
  end

  # rescue_from ActiveRecord::RecordNotFound do
  #   flash[:warning] = 'Resource not found.'
  #   redirect_back_or root_path
  # end

  # def redirect_back_or(path)
  #   redirect_to request.referer || path
  # end

  private

  def find_cart
    cart = Cart.find_by(id: session[:cart_id])
    if cart.blank?
      cart = Cart.create
    end
    session[:cart_id] = cart.id
    return cart
  end
end
