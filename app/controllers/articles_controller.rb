class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @articles = Article.includes(:user).order("created_at DESC")
    @users = User.all
  end
  
  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to action: :index
    else
      render :new
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.save
      redirect_to action: :index
    end
  end

  def destroy
    @article = Article.find(params[:id])
    if @article.destroy
      redirect_to action: :index
    end
  end

  private

  def article_params
    params.require(:article).permit(:user_id, :title, :activity_date, :weather_id, :location, :appeal_point, :memo, :image).merge(user_id: current_user.id)
  end
end
