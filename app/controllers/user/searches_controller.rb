class User::SearchesController < ApplicationController
  def search
    @search = Plan.ransack(params[:q])
    @search_plans = @search.result.includes(:perfecture).page(params[:page]).per(20).order(created_at: :desc)
    @search_perfecture = Perfecture.all
  end
end
