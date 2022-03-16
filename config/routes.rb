Rails.application.routes.draw do
  devise_for :admins

  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  scope module: :public do

    root :to => "homes#top"
    get 'about' => 'homes#about'

    resource :customers, only: [:edit, :update] do
      get 'my_page' => 'customers#show'
      get 'unsubscribe' => 'customers#unsubscribe'
      patch 'withdraw' => 'customers#withdraw'
    end

    resources :addresses, only: [:index, :edit, :create, :update, :destroy]

    resources :items, only: [:index, :show]

    resources :cart_items, only: [:index, :update, :destroy, :create] do
    end

    delete '/cart_items/destroy_all' => 'cart_items#destroy_all'

    resources :orders, only: [:new, :create, :index, :show] do
      post 'confirm' => 'orders#confirm'
    end

    get '/orders/complete' => 'orders#complete'

  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
