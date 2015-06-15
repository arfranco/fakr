class CommentsController < ApplicationController

  def show
    @link = Link.find(params[:id])
    #@comments = Comment.where(link_id: @link.id)
    @comments = @link.comments
    @action = comments_path
    @http_verb = :post
    render :show
  end

  # POST /link/:id/comments
  def create
    if session[:user_id]
      @link = Link.find(params[:id])
      @comment = @link.comments.create(content: params[:content],
                                       user_id: session[:user_id])
    else
      flash[:alert] = "Piss off."
    end
    redirect_to link_id_path(@link)
  end

end