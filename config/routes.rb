Rails.application.routes.draw do
  namespace :user do
    get 'perfectures/show'
  end
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
    resources :perfectures, only: [:show]
  end

  namespace :admin do
    resources :perfectures, only: [:index, :create]
  end
end
