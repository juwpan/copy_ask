Rails.application.routes.draw do
  root to: "questions#index"

  resources :questions do 
    member do
      put 'hide'
      put 'visible'
    end
  end

  resources :users do 
    member do
      get 'confirm_email'
    end
  end
  
  resource :session, only: %i[new create destroy]
  resources :hashtags, only: %i[show]
end
