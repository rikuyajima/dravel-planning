class Admin::PlansController < ApplicationController

  def index
    @plans = Plan.all.page(params[:page]).per(20).order(created_at: :desc)
  end

end
