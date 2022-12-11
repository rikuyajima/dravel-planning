class Admin::SpotsController < ApplicationController
  before_action :admin_scan, only: [:index]

  def index
    @spots = Spot.all.page(params[:page]).per(10).order(created_at: :desc)
  end

  private

  def admin_scan
   unless admin_signed_in?
     redirect_to root_path
   end
  end
end
