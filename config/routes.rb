Rails.application.routes.draw do
  get 'home/index'
  root 'home#index'

    namespace :admin do
      get 'dashboard' => "sites#dashboard"
      resources :events
      resources :speakers, only: [:index, :show]
      resources :sponsers, only: [:index, :show]
    end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
