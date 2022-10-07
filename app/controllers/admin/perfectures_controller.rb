class Admin::PerfecturesController < ApplicationController
  def index
    @perfecture = Perfecture.new
    @perfectures = Perfecture.all
  end

  def create
    @perfecture = Perfecture.new(perfecture_params)
    if @perfecture .save
      redirect_to admin_perfectures_path
    else
      render :index
    end
  end

    private

  def perfecture_params
    params.require(:perfecture).permit(:name)
  end

end

