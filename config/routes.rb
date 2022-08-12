Rails.application.routes.draw do
  root to: "questions#index"

  resources :questions do 
    put 'hide', on: :member
    put 'visible', on: :member
  end

  resources :users do 
    get 'confirm_email', on: :member
  end
  
  resource :session, only: %i[new create destroy]
  resources :hashtags, param: :name, only: %i[show]
end
