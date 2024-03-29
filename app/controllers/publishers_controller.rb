class PublishersController < ApplicationController
  include ApplicationHelper 

  before_action :require_user, except: [:index, :show]

  def new 
    @publisher = Publisher.new
  end 

  def create
    @publisher = Publisher.new(publisher_params)
    if @publisher.save 
      flash[:success] = "Publisher was created successfully"
      redirect_to publishers_path
    else
      render 'new'
    end
  end 

  def index 
    @publishers = Publisher.all.alpha
  end 

  def show 
    @publisher = Publisher.find(params[:id])
  end 

  private 

  def publisher_params 
    params.require(:publisher).permit(:name)
  end

end 