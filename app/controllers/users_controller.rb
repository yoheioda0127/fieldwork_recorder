class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @articles = Article.includes(:user).order("created_at DESC")
    # @article = Article.find(params[:id])
  end
  

  # def followings
  #   @user =User.find(params[:id])
  #   @users =@user.followings.page(params[:page]).per(5)
  #   render 'show_followings'
  # end

  # def followers
  #   @user =User.find(params[:id])
  #   @users =@user.followers.page(params[:page]).per(5)
  #   render 'show_followers'
  # end


  private
  
  def article_params
    params.require(:article).permit(:user_id, :title, :activity_date, :weather_id, :location, :appeal_point, :memo, :top_image, :image_1, :image_2).merge(user_id: current_user.id)
  end
end