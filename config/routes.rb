AgileConf::Application.routes.draw do
  devise_for :admins
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  root "schedules#index"

  get 'login' => 'home#login', as: 'login'
  post 'register' => 'home#register'
  get 'logout' => 'home#logout'

  resources :informations, only: [:index, :show]

  resources :infos do
    collection do
      get 'overview'
      get 'registration'
      get 'security'
      get 'venue'
      get 'contact'
    end
  end

  resources :schedules do
    member do
      get 'register'
      get 'unregister'
    end
  end

  resources :feedbacks
  resources :responses
end
