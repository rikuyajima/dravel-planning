class Admin::ContactsController < ApplicationController
  before_action :admin_scan, only: [:index, :show]
  def index
    @contacts = Contact.all.page(params[:page]).per(10).order(created_at: :desc)
    @spot = Spot.where(status: 0)
  end

  def show
    @contact = Contact.find(params[:id])
  end

  def admin_scan
   unless admin_signed_in?
     redirect_to root_path
   end
  end
end
