# config/routes.rb

Rails.application.routes.draw do
  resources :tasks do
    get 'view_today', on: :collection
  end
end
