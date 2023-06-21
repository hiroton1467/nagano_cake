Rails.application.routes.draw do

  # 顧客用
# URL /customers/sign_in ...
devise_for :customers, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  scope module: :public do
     root to: "homes#top"
     get '/customers/:id/leave' => 'customerss#leave', as: 'leave'
     patch '/customers/:id/withdrawal' => 'customers#withdrawal', as: 'withdrawal'
     resources :customers, only: [:show, :edit, :update, :leave, :withdrawl]
     resources :items, only: [:index, :show]
     resources :cart_items, only: [:index, :create, :update, :destroy, :destroy_all]
  end
# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}

  namespace :admin do
  resources :items, only: [:new, :create, :index, :show, :edit, :update, :destroy]
  resources :customers, only: [:index, :show, :edit, :update]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
