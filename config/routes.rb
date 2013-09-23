TripsApp::Application.routes.draw do
  resources :budgets
  resources :trips do
    resources :itineraries
  end

  devise_for :users
  root to: 'trips#index'
end
