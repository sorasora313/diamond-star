class LikesController < ApplicationController

  def create
    night = Night.find(params[:night_id])
    like = current_user.likes.new(night_id: night.id)
    like.save
    redirect_to night_path(like.night)
  end

  def destroy
    night = Night.find(params[:night_id])
    like = current_user.likes.find_by(night_id: night.id)
    like.destroy
    redirect_to night_path(like.night)
  end
end