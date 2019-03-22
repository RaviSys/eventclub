# frozen_string_literal: true

class ActionDispatch::Routing::Mapper
  def draw(routes_name)
    instance_eval(File.read(Rails.root.join("config/routes/#{routes_name}.rb")))
  end
end

Rails.application.routes.draw do
  devise_for :users
  resources :users, only: :show
  get '/myticket/:event_id' => 'users#myticket', as: :myticket
  resources :users, only: :show
  root 'home#index'
  resources :events, only: %i[index show]
  resources :favourites, only: [:create]
  get '/search_events' => 'home#search_events'
  get 'tags/:tag', to: 'home#tagged_events', as: :tag
  resources :order_items
  post '/payment' => 'order_items#payment'
  delete '/cancel_order' => 'order_items#delete_order'
  draw :admin
end
