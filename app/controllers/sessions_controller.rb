class SessionsController < ApplicationController
 
 def new
 end

  def create
    
    user = User.find_by(email: params[:session][:email].downcase)

    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      session[:username] = user.username
      flash[:success] = "You have successfully logged in"
      redirect_to :controller => 'users', :action => 'index'
    else
      flash[:danger] = "email or password is incorrect"
      render 'new' 
  end
end


  def destroy
    session[:user_id] = nil
    session[:username] = nil
    redirect_to :controller => 'users', :action => 'new'
  end
end
