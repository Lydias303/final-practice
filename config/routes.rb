Rails.application.routes.draw do
  get 'todos/index'

  root 'todos#index'
  resources :todos, only: [:index, :create, :destroy, :update, :edit]
  namespace :api do
    namespace :v1 do
      resources :todos, only: [:index, :show, :create, :update, :destroy]
    end
  end
end
