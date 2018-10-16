class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy, :add_comment]


  def add_comment
    @comment = @article.comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      flash[:notice] = "Successfully created comment."
      redirect_to @commentable
    else
      flash[:error] = "Error adding comment."
    end
    
  end

  def index
    @comment = Comment.new
    search = params[:search]
    if search.present?
      @articles = Article.where('title LIKE ? ', search).paginate(page: params[:page], per_page: 1)
    else
      @articles = Article.paginate(page: params[:page], per_page: 1)
      # @articles = Article.all
    end
  end

  def show
    @comment = Comment.new
    @comments = Comment.where(article_id: @article.id)
  end

  def new
    @article = Article.new
    @sub_categories = SubCategory.all
  end

  def edit
    @sub_categories = SubCategory.all
  end

  def all_articles
    @articles = Article.all
    
  end

  def create
    @article = Article.new(article_params)
    @sub_categories = SubCategory.all
    @article.user_id = current_user.id
    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if (current_user.admin) || (@article.user_id == current_user.id)
      @sub_categories = SubCategory.all

      respond_to do |format|
        if @article.update(article_params)
          format.html { redirect_to @article, notice: 'Article was successfully updated.' }
          format.json { render :show, status: :ok, location: @article }
        else
          format.html { render :edit }
          format.json { render json: @article.errors, status: :unprocessable_entity }
        end
     end
    else
      redirect_to @article, notice: 'Not admin or creator.'
    end
  end

  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_article
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:title, :content, sub_category_ids: [], comment_attributes: [ :comment, :user_id, :article_id, :commentable_id, :commentable_type])
    end

     def comment_params
       params.require(:comment).permit(comment_attributes: [ :comment, :user_id, :article_id, :commentable_id, :commentable_type])
       
     end
end
