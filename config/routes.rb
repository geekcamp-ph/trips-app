TripsApp::Application.routes.draw do
  resources :trips do
    resources :itineraries
  end
end
