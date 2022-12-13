class Admin::SearchesController < ApplicationController

 def search
  # byebug
    @range = params[:range]

    if @range == "ユーザー"
      @search_user = User.looks(params[:search], params[:word])
    elsif @range == "スポット"
      @search_spot = Spot.looks(params[:search], params[:word])
    else
      @search_plan = Plan.looks(params[:search], params[:word])
    end
 end
end
