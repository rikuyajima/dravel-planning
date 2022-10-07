class User::PlanCommentsController < ApplicationController
  def create
    @plan = Plan.find(params[:plan_id])
    @comment = current_user.plan_comments.new(plan_comment_params)
    @comment.plan_id = @plan.id
    @comment.save

  end

  def destroy
    PlanComment.find(params[:id]).destroy
    @plan = Plan.find(params[:plan_id])

  end

  private

  def plan_comment_params
    params.require(:plan_comment).permit(:comment)
  end
end
