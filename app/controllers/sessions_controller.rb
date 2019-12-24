class SessionsController < ApplicationController 

  def new 
    render :layout => "home"
  end
  
  def create 
    if auth_hash = request.env['omniauth.auth']
      user = User.find_or_create_by_omniauth(auth_hash)
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      user = User.find_by(email: params[:session][:email].downcase)
      if user && user.authenticate(params[:session][:password])
        session[:user_id] = user.id
        flash[:success] = "You have successfully logged in"
        redirect_to user_path(user)
      else 
        flash.now[:danger] = "There was something wrong with your login information" 
        render 'users/new'
      end
    end  
  end 

  def destroy 
    session[:user_id] = nil
    flash[:success] = "You have logged out"
    redirect_to root_path
  end 

end 