Rails.application.routes.draw do
  root 'questions#index'

  resources :questions do
    resources :answers, except: %i[new show]
  end
end
