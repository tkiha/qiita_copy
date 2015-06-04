class Auth::FollowTagsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_user


  def create
    tag = params[:follow_tag][:tag]
    @follow_tag = @user.follow_tags.build(tag: tag)
    if @follow_tag.save
      redirect_to tag_path(tag), notice: 'タグをフォローしました'
    else
      redirect_to tag_path(tag), notice: 'エラー！タグをフォローできませんでした'
    end
  end

  def destroy
    @follow_tag = @user.follow_tags.find(params[:id])
    tag = @follow_tag.tag
    @follow_tag.destroy
    redirect_to tag_path(tag), notice: 'タグをフォロー解除しました'
  end

  private
  def set_user
    @user = User.find(params[:user_id])
  end


end
