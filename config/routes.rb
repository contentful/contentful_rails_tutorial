Rails.application.routes.draw do
  root 'welcome#index'

  resources :contentful_users
end
