Rails.application.routes.draw do
  root 'users#new'

  resources :users, only: [:new, :create] do
    collection do
      post 'login', to: 'users#login'
    end
  end

  resources :tasks

  resources :categories

  get 'landing', to: 'pages#landing'
end
