class User::SearchesController < ApplicationController
  def search_spot
      @search_spots = Spot.looks(params[:search], params[:word])
      @perfectures = Perfecture.all
  end
end
