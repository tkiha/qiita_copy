class Auth::FollowsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_user

  def create
    to_user_id = params[:follow][:to_user_id]
    @follow = @user.follows.build(to_user_id: to_user_id)
    if @follow.save
      redirect_to auth_user_articles_url(to_user_id), notice: 'フォローしました'
    else
      redirect_to auth_user_articles_url(to_user_id), notice: 'エラー！フォローできませんでした'
    end
  end

  def destroy
    @follow = @user.follows.find(params[:id])
    to_user_id = @follow.to_user_id
    @follow.destroy
    redirect_to auth_user_articles_url(to_user_id), notice: 'フォロー解除しました'
  end

  private
  def set_user
    @user = User.find(params[:user_id])
  end


end
