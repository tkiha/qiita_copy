class Auth::ArticlesController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_user
  before_action :set_article, only: [:edit, :update, :destroy]

  def index
  end

  def feed
  end

  def follows
  end

  def follow_tags
  end

  def stocks
  end

  def markdown_preview
    @markdown = params[:markdown]
  end

  def new
    @article = @user.articles.build
  end

  def edit
  end

  def create
    @article = @user.articles.build(article_params)
    set_comment_user
    if @article.save
      redirect_to @article, notice: 'Article was successfully created.'
    else
      render :new
    end
  end

  def update
    if @article.update(article_params)
      redirect_to @article, notice: 'Article was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
    redirect_to auth_user_articles_url(@user), notice: 'Article was successfully destroyed.'
  end

  private
  def set_user
    @user = User.find(params[:user_id])
  end

  def set_article
    @article = @user.articles.find(params[:id])
    set_comment_user
  end

  def set_comment_user
    @article.comment_user = current_user
  end


  def article_params
    params.require(:article).permit(:title, :text, :tag_list, :comments_attributes => [:id, :text, :user_id, :_destroy])
  end
end
