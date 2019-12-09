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

  private 

  def set_comic
    @comic =Comic.find(params[:id])
  end 

  def comic_params 
    params.require(:comic).permit(:title, :series, :issue, :author)
  end 

end  