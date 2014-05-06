AgileConf::Application.routes.draw do

  devise_for :admins
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  root "home#index"

  get 'lottery'   => 'lottery#index'

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

  resources :feedbacks do
    collection do
      get 'statistic'
    end
  end
  
  resources :responses
  resources :votees do
    member do
      get 'toggle'
    end
  end

  resources :votes do
    member do
      get 'up'
      get 'down'
    end
  end
end
