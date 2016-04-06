Rails.application.routes.draw do

  devise_for :users,  :controllers => { :registrations => 'registrations' }
  root 'boards#index'
  get 'search', to: 'search#index'
  resources :boards do
    resources :pins
  end
end
