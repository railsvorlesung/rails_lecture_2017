class CommentsController < ApplicationController

  # NOTE before_filter is deprecated
  before_action :set_article
  before_action :set_comments, only: [:index]
  before_action :set_comment,  only: [:edit, :destroy, :update]

  def update
    if @comment.update_attributes(permit_params)
     redirect_to article_comments_url(@article)
    else
      render :edit
    end
  end # #update

  def destroy
    @comment.destroy
    redirect_to article_comments_url(@article)
  end # #destroy

  protected

  def permit_params
    params.require(:comment).permit(:commenter, :body)
  end # #permit_params

  def set_article
    @article = Article.find(params[:article_id])
  end # #set_article

  def set_comments
    @comments = @article.comments.page(params[:page])
  end # #set_comments

  def set_comment
    @comment = Comment.find(params[:id])
  end # #set_comment
end
