class User::SpotCommentsController < ApplicationController
  def create
    @spot = Spot.find(params[:spot_id])
    @comment = current_user.spot_comments.new(spot_comment_params)
    @comment.spot_id = @spot.id
    @comment.save

  end

  def destroy
    SpotComment.find(params[:id]).destroy
    @spot = Spot.find(params[:spot_id])

  end

  private

  def spot_comment_params
    params.require(:spot_comment).permit(:comment, :rate)
  end
end

