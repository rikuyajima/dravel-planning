class User::UsersController < ApplicationController
  before_action :current_user, only: [:edit, :update]
  before_action :ensure_guest_user, only: [:edit]

  def show
    @user = User.find(params[:id])
    @plans = @user.plans
    @spot = @user.spots.where(status: 0)
    #idに紐づくユーザーがお気に入り登録した情報のみを集める
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
     if user_signed_in?
      reset_session
      flash[:notice] = "退会処理を実行いたしました"
      redirect_to root_path
     else
      flash[:notice] = "退会処理を実行いたしました"
      redirect_to '/admin/users'
     end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :profile, :email)
  end

  def ensure_guest_user
    @user = User.find(params[:id])
    if @user.name == "guestuser"
      redirect_to user_path(current_user) , notice: 'ゲストユーザーはプロフィール編集画面へ遷移できません。'
    end
  end

end
