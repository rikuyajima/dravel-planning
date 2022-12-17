class Admin::SpotsController < ApplicationController
  before_action :admin_scan, only: [:index, :show]

  def index
    @spots = Spot.all.page(params[:page]).per(10).order(created_at: :desc)
    @spot = Spot.where(status: 0)
  end

  def show
    @spot = Spot.find(params[:id])
    @perfectures = Perfecture.all
    @comment = SpotComment.new
  end

  private

  def admin_scan
   unless admin_signed_in?
     redirect_to root_path
   end
  end
end
