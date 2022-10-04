class User::PlansController < ApplicationController
  def new
    @plan = Plan.new
  end

  def create
    @plan = Plan.new(recipe_params)
    if @plan.save
      redirect_to root_path
    else
      render :new
    end
  end


  def index
  end

  def show
  end

  def edit
  end

  private

  def recipe_params
    params.require(:plan).permit(:user_id, :situation, :nprefecture, :image, :start, :gole, :introduction, :minutes, :attention,
                                  ##planでrelayのカラムを保存するための記述
                                  relays_attributes:[:reley_point, :point_introduction, :image, :travel_time, :travel_attention, :_destroy])
  end
end

