Rails.application.routes.draw do
  root 'pages#landing'

  get 'pages/landing' # You can keep this line if you want to keep the explicit route for the landing page

  resources :users, only: [:new, :create] do
    collection do
      get 'login' # Use GET for login page
      post 'login', to: 'users#authenticate' # Use POST for authentication
    end
  end

  resources :tasks do
    get 'view_today', on: :collection
  end

end
