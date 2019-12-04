Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"

  resources :items
  resources :regisrations do
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
  resources :cards do
    collection do
      get 'done'
      post 'pay'
    end
  end
end



