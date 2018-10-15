class CommentsController < ApplicationController
   before_action :set_comment, only: [:show, :edit, :update, :destroy]

  def new
    @comment = Comment.new
  end

  def create
    puts "hello comment"
    @comment = Comment.new(comment_params)
    @comment.save
    # @comment = Comment.create(comment: params[:comment][:comment], article_id: params[:comment][:article_id])

    redirect_to articles_path
  end

  def update
  end

  
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to articles_path, notice: 'comment deleted' }
    end
  end

  def view
  end
   
  private

    def set_comment
      @comment = Comment.find(params[:id])
      #@comment = Comment.new
    end

    def comment_params
      params.require(:comment).permit(:comment, :article_id, :user_id)
    end
end
