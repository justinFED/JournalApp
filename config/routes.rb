Rails.application.routes.draw do
  root 'users#new'  # Redirect to the combined registration and login page

  resources :users, only: [:new, :create] do
    collection do
      post 'login', to: 'users#login' # Use POST for authentication
    end
  end

  # ... other routes ...
end
