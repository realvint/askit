Rails.application.routes.draw do
  root 'questions#index'

  resources :users, only: %i[new create]

  resources :questions do
    resources :answers, except: %i[new show]
  end
end
