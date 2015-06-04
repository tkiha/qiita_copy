class Auth::UsersController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_user

  def follow_users
  end

  def followers
  end

  def comments
  end

  def alerts
  end

  private
  def set_user
    @user = User.find(params[:id])
  end


end
