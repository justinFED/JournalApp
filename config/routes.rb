Rails.application.routes.draw do
  resources :users, only: [:new, :create] do
    collection do
      get 'login' # Use GET for login page
      post 'login', to: 'users#authenticate' # Use POST for authentication
    end
  end

  resources :tasks do
    get 'view_today', on: :collection
  end

  # Additional routes for other resources or actions can be added as needed
end
