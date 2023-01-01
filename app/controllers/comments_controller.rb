class CommentsController < ApplicationController
  before_action :article_id, only: :create

  def index; end

  def new; end

  def create
    @comment = @article.comments.build(comment_params)
    if @comment.save
      redirect_to @article, notice: 'Comment was successfully created.'
    else
      flash[:alert] = 'Comment cannot be created.'
      render 'articles/show'
    end
  end

  def edit; end

  private

  def article_id
    @article = Article.find_by_id(params[:article_id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
