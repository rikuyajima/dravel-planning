class User::PerfecturesController < ApplicationController
  def show
    @perfectures = Perfecture.all
    @perfecture = Perfecture.find(params[:id])
    @favorites = @perfecture.plans.includes(:favorited_users).sort {|a,b| b.favorited_users.size <=> a.favorited_users.size}
  end
end
