Rails.application.routes.draw do
  devise_for :users
  root to: "regisration#index"

  resources :regisration do
    collection do
      get 'signup'
      get 'phone'
      get 'address'
      get 'step4'
      get 'done'
    end
  end

end


