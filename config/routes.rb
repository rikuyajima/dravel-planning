Rails.application.routes.draw do

  # 顧客用
devise_for :customers, controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

  scope module: :public do
    root to: 'homes#top'
    resources :plans, only: [:new, :create, :index, :show, :edit, :update, :destroy]
    resources :users, only: [:new, :create, :index, :show, :edit, :update]
  end
  namespace :admin do
    resources :customers, only: [:index, :show, :edit, :update]
  end

end
