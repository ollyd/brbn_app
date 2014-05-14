BrbnApp::Application.routes.draw do
  root :to => 'pages#home'
  get 'pages/tasting' => "pages#tasting"
  get 'pages/contact' => "pages#contact"


  devise_for :users
  resources :bourbons
  resources :ratings, only: :update
end
