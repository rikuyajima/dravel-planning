class User::PlansController < ApplicationController
  def new
    @plan = Plan.new
    @perfectures = Perfecture.all
  end

  def create
    @plan = Plan.new(plan_params)
    @plan.user_id = current_user.id
    if @plan.save
      flash[:notice] = "投稿しました。"
      redirect_to plans_path
    else
      render :new
    end
  end

  def index
    @plans = Plan.all.order(created_at: :desc).page(params[:page]).per(20).order(created_at: :desc)
    @favorites = @search_plans.includes(:favorited_users).sort {|a,b| b.favorited_users.size <=> a.favorited_users.size}
    @perfectures = Perfecture.all
  end

  def show
    @plan = Plan.find(params[:id])
    if user_signed_in?
      unless ViewCount.find_by(user_id: current_user.id, plan_id: @plan.id)
        current_user.view_counts.create(plan_id: @plan.id)
      end
    end
    @perfectures = Perfecture.all
    @comment = PlanComment.new
  end

  def edit
     @plan = Plan.find(params[:id])
    if @plan.user == current_user
      render "edit"
    else
    redirect_to plans_path
    end
  end

  def update
    @plan = Plan.find(params[:id])
    if @plan.update(plan_params)
      flash[:notice] = "投稿内容の修正が正常に完了しました。"
       redirect_to plan_path(@plan.id)
    else
       render :edit
    end
  end

  def destroy
    @plan = Plan.find(params[:id])
    @plan.destroy
    if user_signed_in?
      redirect_to '/plans'
    else
      redirect_to '/admin/plans'
    end
  end

  private

  def plan_params
    params.require(:plan).permit(:user_id, :situation, :perfecture_id, :start_image, :gole_image, :start, :gole, :start_introduction, :gole_introduction, :minutes, :attention,
                                  ##planでrelayのカラムを保存するための記述
                                  relays_attributes:[:id, :relay_point, :point_introduction, :image, :travel_time, :travel_attention, :_destroy])
  end
end

