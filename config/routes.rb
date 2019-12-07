Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"

  resources :users ,only: [:show,:edit]
  resources :items
  resources :regisrations ,only:[:index,:show] do
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
    collection do
      get 'done'
    end
    member do
      get 'check'
      post 'pay'
    end
  end
end



