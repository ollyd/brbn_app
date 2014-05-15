BrbnApp::Application.routes.draw do
  get "ratings/index"
  get "ratings/new"
  get "ratings/update"
  root :to => 'pages#home'
  get 'pages/tasting' => "pages#tasting"
  get 'pages/contact' => "pages#contact"


  devise_for :users
  resources :bourbons
  resources :ratings, only: :update
end
