class NightsController < ApplicationController
  before_action :set_nights, except: [:index, :new, :create]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :contributor_confirmation, only: [:edit, :update, :destroy]
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
    @comment = Comment.new
    @comments = @night.comments.includes(:user)
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
  def destroy
    night = Night.find(params[:id])
    night.destroy
    redirect_to root_path
  end
  
 

  private
  def night_params
    params.require(:night).permit(:image, :title, :explain, :genre_id,:state_id).merge(user_id: current_user.id)
  end
  def set_nights
    @night = Night.find(params[:id])
  end

  def contributor_confirmation
    redirect_to root_path unless current_user == @night.user
  end
  


end
