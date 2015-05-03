Rails.application.routes.draw do
  get 'todos/index'

  root 'todos#index'
  resources :todos, only: [:index, :create, :destroy, :update]
end
