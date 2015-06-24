class LinksController < ApplicationController

  before_action :authenticate_user!, only: [:create, :update]
  
  def create
    @link = Link.create(title: params[:title],
                        destination: params[:destination],
                        created_at: DateTime.now)
    redirect_to links_path
    # redirect_to post_path(@post)
  end

  def new
    @link = Link.new
    render :new
  end

  def show
    @links = Link.all
    render :index

  end



end