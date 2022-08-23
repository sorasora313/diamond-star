class NightsController < ApplicationController

  def index
    @night = Night.all.order("created_at DESC")
  end

  def new
    @night = Night.new
  end

  def create
    @night = Night.new(night_params)
    if@night.valid? 
      @night.save
      redirect_to root_path (@night)
    else
      render :new
      @night = Night.includes(:user)
    end
  end

  def show
    @night = Night.find(params[:id])
  end

  def edit
    @night = Night.find(params[:id])

  end

  def update
    @night = Night.find(params[:id])
    @night.update(night_params)
    if @night.save
      redirect_to night_path
    else
      render :edit
    end
  end
  
 

  private
  def night_params
    params.require(:night).permit(:image, :title, :explain, :genre_id,:state_id).merge(user_id: current_user.id)
  end
  


end
