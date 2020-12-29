class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:namename, :email, :encrypted_password, :birthday, :school_and_campany, :major_id, :research_theme, :introduction])
  end
end