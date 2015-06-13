class CommentsController < ApplicationController
  def comments
    page = params[:page] || 1
    @comments = self.get_page(page)
    render :comments
  end

  def show
    @comment = Comment.find(params[:user_id, :link_id])
    render :comments
  end

  def new
    @comment = Comment.new
    @action = comments_path
    @http_verb = :post
    render :comments
  end

  def create
    @comments = Comments.create(user: params[:user_id],
                        content: params[:content],
                        created_at: DateTime.now)
    redirect_to comments_path
  end

  def edit
    @comments = Comments.find(params[:user_id, :link_id])
    @action = comments_path(@comments)
    @http_verb = :patch
    render :comments
  end

  def update
    @comments = Comments.create(user: params[:user_id],
                        content: params[:content],
                        updated_at: DateTime.now)
    redirect_to comments_path(@comments)
  end

  def delete
    @comments = Comments.find(params[:user_id, :link_id])
    @comments.destroy
    redirect_to comments_path
  end

  protected
  def get_page(n)
    page_offset = (n - 1) * 10
    Comments.order(written_at: :content).offset(page_offset).limit(10)
  end
end