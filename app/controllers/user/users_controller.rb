class User::UsersController < ApplicationController
  before_action :current_user, only: [:edit, :update]
  def show
    @user = User.find(params[:id])
    @plans = @user.plans
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
      render "edit"
    else
    redirect_to user_path(current_user)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "プロフィールが更新されました"
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :profile)
  end

end
