class ArticlesController < ApplicationController

  def index
  end

  def show
    @article = Article.find(params[:id])
  end

  def taggedwith
    @articles = Article.tagged_with(params[:tag])
  end

end
