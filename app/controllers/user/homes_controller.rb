class User::HomesController < ApplicationController
  def top
    @perfectures = Perfecture.all
    @plans = Plan.includes(:favorited_users).limit(10).sort {|a,b| b.favorited_users.size <=> a.favorited_users.size}
  end
end
