class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_article, only: [:edit, :show, :update, :destroy]

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
    def activity
      (Article.count).to_s
    end
    @days = activity
  end

  def edit
    if @article.user_id != current_user.id
      redirect_to action: :index
    end
  end

  def update
    if @article.update(article_params)
      redirect_to action: :index
    else
      render :edit
    end
  end

  def destroy
    if @article.destroy
      redirect_to action: :index
    end
  end

  private

  def article_params
    params.require(:article).permit(:user_id, :title, :activity_date, :weather_id, :location, :appeal_point, :memo, :top_image, :image_1, :image_2).merge(user_id: current_user.id)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
