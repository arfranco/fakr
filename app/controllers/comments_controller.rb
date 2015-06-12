class CommentsController < ApplicationController
  

  def create
    @comments = Comment.create(content: params[:content],
                        written_at: DateTime.now)
    redirect_to link_id_comments_path
    # redirect_to post_path(@post)
  end



end