class TagsController < ApplicationController

  def show
    @tag = params[:id]
    @articles = Article.tagged_with(@tag)
  end


end
