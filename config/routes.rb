Rails.application.routes.draw do

  devise_for :users
  root 'boards#index'
  resources :boards do
    resources :pins
  end
end
