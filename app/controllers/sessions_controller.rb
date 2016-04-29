class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Welcome"
      redirect_to root_path
    else
      flash[:error] = "Incorrect username/password"
      render action: 'new'
    end
  end

  def destroy
  end
end
