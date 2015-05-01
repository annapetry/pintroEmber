Rails.application.routes.draw do
  root 'ember#bootstrap'
  get '/*path' => 'ember#bootstrap'

  resources :users,   only: [:new, :create]
  resource  :session, only: [:new, :create, :destroy]
end
