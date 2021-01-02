class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def application
    @user = User.find(params[:id])
    
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :avatar, :email, :encrypted_password, :birthday, :school_and_company, :major_id, :research_theme, :introduction])
  end
end