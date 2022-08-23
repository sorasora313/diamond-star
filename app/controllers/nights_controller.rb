class NightsController < ApplicationController

  def index
    @night = Night.order("created_at DESC")
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

  private
  def night_params
    params.require(:night).permit(:image, :title, :explain, :genre_id,:state_id).merge(user_id: current_user.id)
  end
  


end
