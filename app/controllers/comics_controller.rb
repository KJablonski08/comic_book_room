class ComicsController < ApplicationController 
  include ApplicationHelper 

  before_action :set_comic, only: [:edit, :show, :update, :destroy]
  before_action :require_user, except: [:index, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def index 
    @comics = Comic.all
  end 

  def show 
    @comments = Comment.all
  end 

  def new 
    @comic = Comic.new
  end 

  def create 
    @comic = Comic.new(comic_params)
    @comic.user = current_user 
    if @comic.save 
      flash[:success] = "Comic was successfully created"
      redirect_to comic_path(@comic)
    else 
      render 'new'
    end 
  end

  def edit 
  end 

  def update
    if @comic.update(comic_params)
      flash[:success] = "comic was successfully updated"
      redirect_to comic_path(@comic)
    else 
      render 'edit'
    end 
  end 

  def destroy 
    @comic.destroy
    flash[:danger] = "Comic was successfully destroyed"
    redirect_to comics_path
  end 


  private 

  def set_comic
    @comic =Comic.find(params[:id])
  end 

  def comic_params 
    params.require(:comic).permit(:series_title, :issue_number, :quantity_owned, :condition, :anonymous)
  end 

  def require_same_user 
    if current_user != @comic.user 
      flash[:danger] = "You can only edit or delete your own comic"
      redirect_to comics_path
    end 
  end 

end  