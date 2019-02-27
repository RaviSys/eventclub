Rails.application.routes.draw do
  root 'home#index'

  namespace :admin do
    get 'dashboard' => "sites#dashboard"
    resources :events
    resources :speakers, only: [:index, :show]
    resources :sponsers, only: [:index, :show]
  end

  resources :events, only: [:index, :show]
  
  get '/search_events' => "home#search_events"  
  get 'tags/:tag', to: 'home#tagged_events', as: :tag

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
