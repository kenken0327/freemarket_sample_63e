Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"

  resources :users ,only: [:index,:show,:edit,:update]
  resources :items do
    member do
      patch 'addbuyid'
      end
    end
  resources :regisrations ,only:[:index,:show,:create] do
    collection do
      get 'login'
      get 'signup'
      post 'signup_validates'
      get 'phone'
      post 'register'
      get 'address'
      post 'address_create'
      get 'create_finish'
    end
  end
  resources :cards , only:[:new,:create]do
    member do
      get 'check'
      post 'pay'
      get 'done'
    end
  end
end



