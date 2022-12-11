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
    @spots = Spot.where(status: 1).order(created_at: :desc).page(params[:page]).per(12).order(created_at: :desc)
    @perfectures = Perfecture.all
  end

  def show
    @spot = Spot.find(params[:id])
    @perfectures = Perfecture.all
    @comment = SpotComment.new
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
      flash[:notice] = "情報を更新しました。"
       redirect_to admin_spots_path
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
    params.require(:spot).permit(:address, :lat, :lng, :name, :perfecture_id, :status, images: [])
  end
end
