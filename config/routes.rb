Rails.application.routes.draw do
  root 'welcome#index'
  resources :recipes, :ingredients
end
