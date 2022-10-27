class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :search

  def search
    @search = Plan.ransack(params[:q])
    @search_plans = @search.result.includes(:perfecture).page(params[:page]).per(20).order(created_at: :desc)
    @search_perfecture = Perfecture.all
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :profile])
  end

end
