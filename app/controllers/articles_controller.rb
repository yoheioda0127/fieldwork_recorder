class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    Article.includes(:user).order("created_at DESC")
    @articles = Article.all
    @users = User.all

  end

end
