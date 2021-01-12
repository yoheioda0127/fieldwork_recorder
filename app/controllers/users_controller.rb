class UsersController < ApplicationController

  def edit
  end

  def show
    @user = User.find(params[:id])
    @articles = Article.includes(:user).order("created_at DESC")
    # @article = Article.find(params[:id])
  end
  
  private
  
  def article_params
    params.require(:article).permit(:user_id, :title, :activity_date, :weather_id, :location, :appeal_point, :memo, :top_image, :image_1, :image_2).merge(user_id: current_user.id)
  end
end
