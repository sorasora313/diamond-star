class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to night_path(@comment.night)
  else
    @night = @comment.night
    @comments = @night.comments
    render "nights/show"
  end
  end
  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_to night_path(comment.night)
  end
 private
     def comment_params
      params.require(:comment).permit(:content).merge(user_id: current_user.id,  night_id: params[:night_id])
     end
   end
