class UsersController < ApplicationController
  

  def create
    @user = User.create(email: params[:email],
                        password: params[:password],
                        written_at: DateTime.now)
    redirect_to links_path
    # redirect_to post_path(@post)
  end



end
