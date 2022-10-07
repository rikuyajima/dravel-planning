class User::PerfecturesController < ApplicationController
  def show
    @perfectures = Perfecture.all
    @perfecture = Perfecture.find(params[:id])
  end
end
