class Auth::StocksController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_user
  before_action :set_article


  def create
    @stock = @article.stocks.build(user_id: @user.id)
    if @article.save
      redirect_to @article, notice: 'ストックしました'
    else
      redirect_to @article, notice: 'エラー！ストックできませんでした'
    end
  end

  def destroy
    @stock = @article.stocks.find(params[:id])
    @stock.destroy
    redirect_to @article, notice: 'ストック解除しました'
  end

  private
  def set_user
    @user = User.find(params[:user_id])
  end

  def set_article
    @article = @user.articles.find(params[:article_id])
  end

end
