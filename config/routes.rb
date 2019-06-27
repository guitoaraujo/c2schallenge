Rails.application.routes.draw do
  resources :inputs
  root 'inputs#index'
end
