class User::UsersController < ApplicationController
  before_action :current_user, only: [:edit, :update]
  def show
    @user = User.find(params[:id])
    @plans = @user.plans
    favorites = Favorite.where(user_id: @user.id).pluck(:plan_id)
    @favorites = Plan.find(favorites)
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
  
  #退会機能
  def withdrawal
    @user = User.find(params[:id])
    @user.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :profile)
  end

end
