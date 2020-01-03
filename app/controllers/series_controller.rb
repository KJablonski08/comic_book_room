class SeriesController < ApplicationController 
  include ApplicationHelper 

  before_action :require_user, except: [:index, :show]

  def index 
    @series = Series.all.alpha.page(params[:page]).per(10)
  end

  def new 
    @series = Series.new
  end 

  def create
    @series = Series.new(series_params)
    if @series.save 
      flash[:success] = "Series was created successfully"
      redirect_to series_index_path
    else
      render 'new'
    end
  end 

  def show 
    @series = Series.find(params[:id])
    @series_comics = @series.comics.order('created_at DESC')
  end 

  private 

  def series_params 
    params.require(:series).permit(:title, comic_ids: [], publisher_ids: [])
  end

end 