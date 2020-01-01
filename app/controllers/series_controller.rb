class SeriesController < ApplicationController 

  def index 
    @series = Series.all 
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
  end 

  private 

  def series_params 
    params.require(:series).permit(:title)
  end

end 