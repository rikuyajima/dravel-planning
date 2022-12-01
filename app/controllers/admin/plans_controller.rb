class Admin::PlansController < ApplicationController
  before_action :admin_scan, only: [:index]

  def index
    @plans = Plan.all.page(params[:page]).per(20).order(created_at: :desc)
  end
  
  private
  
  def admin_scan
   unless admin_signed_in?
     redirect_to root_path
   end
  end

end
