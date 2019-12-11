class ComicsController < ApplicationController 

  before_action :set_comic, only: [:edit, :show, :update, :destroy]

  def index 
    @comics = Comic.all
  end 

  def show 
  end 

  def new 
    @comic = Comic.new
  end 

  def create 
    @comic = Comic.new(comic_params)
    if @comic.valid?
      @comic.save  
      flash[:notice] = "Comic was successfully created"
      redirect_to comic_path(@comic)
    else 
      render 'new'
    end 
  end

  def edit 
  end 

  def update
    if @comic.update(comic_params)
      flash[:notice] = "Comic was successfully updated"
      redirect_to comic_path(@comic)
    else 
      render 'edit'
    end 
  end 

  def destroy 
    @comic.destroy
    flash[:notice] = "Comic was successfully destroyed"
    redirect_to comics_path
  end 


  private 

  def set_comic
    @comic =Comic.find(params[:id])
  end 

  def comic_params 
    params.require(:comic).permit(:series_title, :issue_number, :quantity_owned, :condition, :anonymous)
  end 

end  