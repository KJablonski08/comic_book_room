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
    @comic.save 
    redirect_to comics_show(@comic)
  end

  def edit 
  end 

  def update
    if @comic.update(comic_params)
      redirect_to comic_path(@comic)
    else 
      render 'edit'
    end 
  end 

  def destroy 
    @comic.destroy
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