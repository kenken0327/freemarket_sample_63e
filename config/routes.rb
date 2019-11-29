Rails.application.routes.draw do
  devise_for :users
  root to: "regisration#index"

  resources :regisration do
    collection do
      get 'signup'
      post 'signup_validates'
      get 'phone'
      post 'register'
      get 'address'
      post 'address_create'
      get 'create_finish'
    end
  end
end



