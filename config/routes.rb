AgileConf::Application.routes.draw do
  get "responses/create"
  get "responses/index"
  get "responses/new"
  devise_for :admins
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  root "home#index"

  get 'login' => 'home#login', as: 'login'
  post 'register' => 'home#register'
  get 'logout' => 'home#logout'

  resources :infos do
    collection do
      get 'overview'
    end
  end

  resources :schedules
  resources :feedbacks
  resources :responses
end
