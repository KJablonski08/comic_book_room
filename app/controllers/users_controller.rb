class UsersController < ApplicationController

  before_action :set_user, only: [:edit, :update, :show, :destroy]

  def index
    @users = User.all 
  end 

  def show 
    @user_comics = @user.comics.order('created_at DESC')
  end 

  def new
    @user = User.new
    render :layout => "home"
  end 

  def create 
    @user = User.new(user_params)
    if @user.save 
      flash[:success] = "Welcome to the Comic Book Room #{@user.username}"
      redirect_to user_path(@user)
    else 
      render 'new'
    end 
  end 

  def edit 
  end 

  def update 
    if @user.update(user_params)
      flash[:success] = "User was successfully updated"
      redirect_to user_path(@user)
    else 
      render 'edit'
    end 
  end 

  def destroy 
    @user.destroy
    flash[:danger] = "User account was successfully destroyed"
    redirect_to users_path
  end 

  private 

  def set_user 
    @user =User.find(params[:id])
  end 

  def user_params 
    params.require(:user).permit(:username, :name, :email, :password)
  end 

end 