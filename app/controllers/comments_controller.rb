class CommentsController < ApplicationController

  def comments
    page = params[:page] || 1
    @comments = self.get_page(page)
    render :show
  end

  def show
    @comment = Comment.find(params[:link_id],
                      content: params[:content])
    @action = comments_path(@links)
    @http_verb = :get
    render :show
  end

  def new
    @comments = Comment.new
    render :new
  end

  def create
    @comments = Comments.create(link: params[:link_id],
                        content: params[:content],
                        created_at: DateTime.now)
    @http_verb = :post
    redirect_to :comments
  end

  def edit
    @comments = Comments.find(params[:link_id],
                        content: params[:content])
    @action = links_path(@links)
    @http_verb = :patch
    render :comments
  end

  def update
    @comments = Comment.update(content: params[:content],
                          updated_at: DateTime.now)
    @http_verb = :patch
    redirect_to :comments
  end

  def delete
    @comments = Comment.find(:link_id)
    @comments.destroy
    redirect_to :comments
  end

  protected
  def get_page(n)
    page_offset = (n - 1) * 10
    Comments.order(written_at: :content).offset(page_offset).limit(10)
  end

end