class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    Article.includes(:user).order("created_at DESC")
    @articles = Article.all
    @users = User.all
  end
  
  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
  end

  def edit
    User.find(params[:id])
    @user.user_id != current_user.id || @user.information.present?
    redirect_to action: :index
  end

  private

  def article_params
    params.require(:article).permit(:user_id, :major_id, :title, :activity_date, :weather_id, :location, :appeal_point, :memo, :image).merge(user_id: current_user.id)
  end
end
