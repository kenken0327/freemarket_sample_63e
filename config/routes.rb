Rails.application.routes.draw do
  devise_for :users
  root to: "regisration#step1"

  resources :regisration do
    collection do
      get 'step1'
      get 'step2'
      get 'step3'
      get 'step4' 
      post 'step5'
      get 'done'
  end
end

end
