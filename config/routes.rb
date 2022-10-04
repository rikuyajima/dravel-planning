Rails.application.routes.draw do
# ユーザー用
devise_for :users, controllers: {
  registrations: "user/registrations",
  sessions: 'user/sessions'
}
# 管理者用
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

  scope module: :user do
    root to: 'homes#top'
    resources :plans, only: [:new, :create, :index, :show, :edit, :update, :destroy]
    resources :users, only: [:index, :show, :edit, :update]
  end
  namespace :admin do
    resources :customers, only: [:index, :show, :edit, :update]
  end

end
