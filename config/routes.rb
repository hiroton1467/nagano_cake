Rails.application.routes.draw do

  # 顧客用
# URL /customers/sign_in ...
devise_for :customers, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  scope module: :public do
     root to: "homes#top"
     get 'homes/about' => 'homes#about'
     get '/customers/:id/leave' => 'customers#leave', as: 'leave'
     patch '/customers/:id/withdrawal' => 'customers#withdrawal', as: 'withdrawal'
     delete 'cart_items/destroy_all' => 'cart_items#destroy_all'
     post '/orders/confirm' 
     get '/orders/complete'
     
     resources :customers, only: [:show, :edit, :update, :leave, :withdrawl, :destroy]
     resources :items, only: [:index, :show]
     resources :cart_items, only: [:index, :create, :update, :destroy]
     resources :orders, only: [:new, :index, :show, :complete, :create]
     resources :destinations, only: [:index, :create, :edit, :update, :destroy]
     
  end
# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}

  namespace :admin do
  root to: 'homes#top'
  #get 'home/top' => 'homes#top', as: ' '
  resources :items, only: [:new, :create, :index, :show, :edit, :update, :destroy]
  resources :customers, only: [:index, :show, :edit, :update]
  resources :orders, only: [:show]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
