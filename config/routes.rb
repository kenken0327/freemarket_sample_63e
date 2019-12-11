Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"

  resources :users ,only: [:index,:show,:edit,:update]
  resources :items do
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
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
    collection do
      get 'done'
    end
    member do
      get 'check'
      post 'pay'
    end
  end
end



