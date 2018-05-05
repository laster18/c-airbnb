class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  config.generators do |g|
    g.javascripts false
    g.helper false
    g.test_framework false
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :birthday_month, :birthday_day, :birthday_year, :gender, :native_currency, :preferred_locale, :tel_number, :about, :current_city, :avatar])
  end

end
