class RelationshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    @user = User.find(params[:followed_id])
    current_user.follow(@user)
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end

  def destroy
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow(@user)
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end

  def followers #follower一覧
    user = User.find(params[:user_id])
    @users = user.following_user
    # .follower_userメソッド ：Userモデルで定義済
  end

  def followed #followed一覧
      user = User.find(params[:user_id])
      @users = user.follower_user
      # .follower_userメソッド ：Userモデルで定義済
  end

end
