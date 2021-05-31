class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :famly_name, :first_name, :family_name_japanese,:first_name_japanese,:birth_day])
  end
end
