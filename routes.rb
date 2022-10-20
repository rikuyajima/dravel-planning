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
    resources :plans, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
      resources :plan_comments, only: [:create, :destroy]
      resource :favorites, only: [:create, :destroy]
    end
    resources :users, only: [:index, :show, :edit, :update]
    get '/users/:id/unsubscribe' => 'users#unsubscribe', as: 'unsubscribe'
    patch '/users/:id/withdrawal' => 'users#withdrawal', as: 'withdrawal'
    resources :perfectures, only: [:show]
  end

  namespace :admin do
    resources :users, only: [:index, :show]
    resources :plans, only: [:index, :show]
    resources :perfectures, only: [:index, :create]
    get 'admin/searches/search' => 'searches#search', as: 'search'
  end
end
