class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :basic_auth

  def application
    @article = Article.find(params[:id])
    def activity
      (Article.count).to_s
    end
    @days = activity
  end

  
  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :avatar, :email, :encrypted_password, :school_and_company, :major_id, :research_theme, :introduction])
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]  
    end
  end
end