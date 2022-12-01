class Admin::PerfecturesController < ApplicationController
before_action :admin_scan, only: [:index, :edit]
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

  def edit
     @perfecture = Perfecture.find(params[:id])
  end

  def update
    @perfecture = Perfecture.find(params[:id])
    if @perfecture.update(perfecture_params)
      flash[:notice] = "修正が正常に完了しました。"
       redirect_to admin_perfectures_path
    else
       render :edit
    end
  end

  def destroy
    @perfecture = Perfecture.find(params[:id])
    @perfecture.destroy
    redirect_to admin_perfectures_path
  end

    private

  def admin_scan
   unless admin_signed_in?
     redirect_to root_path
   end
  end

  def perfecture_params
    params.require(:perfecture).permit(:name)
  end

end

