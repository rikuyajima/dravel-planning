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
  
  def edit
     @perfecture = Perfecture.find(params[:id])
  end
  
  def update
    @perfecture = Perfecture.find(params[:id])
    if @perfecture.update(perfecture_params)
      flash[:notice] = "修正が正常に完了しました。"
       redirect_to perfectures_path
    else
       render :edit
    end
  end

  def destroy
    @perfecture = Perfecture.find(params[:id])
    @perfecture.destroy
  end

    private

  def perfecture_params
    params.require(:perfecture).permit(:name)
  end

end

