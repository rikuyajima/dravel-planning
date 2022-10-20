class User::PerfecturesController < ApplicationController
  def show
    @perfectures = Perfecture.all.page(params[:page]).per(20).order(created_at: :desc)
    @perfecture = Perfecture.find(params[:id])
    @favorites = @perfecture.plans.includes(:favorited_users).sort {|a,b| b.favorited_users.size <=> a.favorited_users.size}
  end
end
