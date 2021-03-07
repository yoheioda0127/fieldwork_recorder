class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @articles = Article.includes(:user).order("created_at DESC")
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to root_path, dark: 'ユーザー情報の編集ができました'
    else
      flash[:danger] = 'ユーザー情報の編集ができませんでした'
      render :edit
    end
  end

  def following
    @user  = User.find(params[:id])
    @users = @user.following
    render 'show_follow'
  end

  def followers
    @user  = User.find(params[:id])
    @users = @user.follower
    render 'show_follower'
  end


  private
  
  def article_params
    params.require(:article).permit(:user_id, :title, :activity_date, :weather_id, :location, :appeal_point, :memo, :top_image, :image_1, :image_2).merge(user_id: current_user.id)
  end
end