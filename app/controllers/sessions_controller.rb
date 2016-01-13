class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.find_by(email: params[:email])
    if user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to books_path
    else
      render 'new'
    end
  end

  def destroy
  end
end
