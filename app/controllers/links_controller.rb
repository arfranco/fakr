class LinksController < ApplicationController
  
  def create
    @links = Link.create(title: params[:title],
                        destination: params[:destination],
                        written_at: DateTime.now)
    redirect_to links_path
    # redirect_to post_path(@post)
  end



end