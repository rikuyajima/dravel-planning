Rails.application.routes.draw do

devise_for :users, controllers: {
  registrations: "user/registrations",
  sessions: 'user/sessions'
}

devise_scope :user do
  post 'users/guest_sign_in', to: 'user/sessions#guest_sign_in'
end


devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

  scope module: :user do
      root to: 'homes#top'
      resources :plans, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
      resources :plan_comments, only: [:create, :destroy]
      resource :favorites, only: [:create, :destroy]
    end
      resources :spots, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
      resources :spot_comments, only: [:create, :destroy]
    end
      resources :contacts, only: [:new, :create, :index, :show, :update, :destroy]
      get '/spots/:id/status' => 'spots#status', as: 'status'
      resources :users, only: [:show, :edit, :update]
      get '/users/:id/unsubscribe' => 'users#unsubscribe', as: 'unsubscribe'
      patch '/users/:id/withdrawal' => 'users#withdrawal', as: 'withdrawal'
      resources :perfectures, only: [:show]
      get '/plans/search' => 'plans#search', as: 'search_result'
      get '/searches/search_spot' => 'searches#search_spot', as: 'search'
  end

  namespace :admin do
    resources :users, only: [:index, :show]
    resources :contacts, only: [:index, :show]
    resources :spots, only: [:index, :show]
    resources :plans, only: [:index, :show]
    resources :perfectures, only: [:index, :create, :edit, :update, :destroy]
    get 'admin/searches/search' => 'searches#search', as: 'search'
  end
end
