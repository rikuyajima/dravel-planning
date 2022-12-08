class User::SpotsController < ApplicationController
  def new
    @spot = Spot.new
    @perfectures = Perfecture.all
  end

  def create
    @spot = Spot.new(spot_params)
    @spot.user_id = current_user.id
    if @spot.save
      flash[:notice] = "投稿しました。"
      redirect_to spots_path
    else
      render :new
    end
  end

  def index
    @spots = Spot.all.order(created_at: :desc).page(params[:page]).per(12).order(created_at: :desc)
    @perfectures = Perfecture.all
  end

  def show
    @spot = Spot.find(params[:id])
    @perfectures = Perfecture.all
    @comment = PlanComment.new
  end

  def edit
    @spot = Spot.find(params[:id])
    if @spot.user == current_user
      render "edit"
    else
    redirect_to spots_path
    end
  end

  def update
    @spot = Spot.find(params[:id])
    if @spot.update(spot_params)
      flash[:notice] = "投稿内容の修正が正常に完了しました。"
       redirect_to spot_path(@spot.id)
    else
       render :edit
    end
  end

  def destroy
    @spot = Spot.find(params[:id])
    @spot.destroy
    if user_signed_in?
      redirect_to '/spots'
    else
      redirect_to '/admin/spots'
    end
  end

  private

  def spot_params
    params.require(:spot).permit(:address, :name, :perfecture_id, images: [])
  end
end
