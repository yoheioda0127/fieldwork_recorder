class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @articles = Article.all
    @users = User.all
  end

end
