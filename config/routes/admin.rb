# frozen_string_literal: true

namespace :admin do
  get 'dashboard' => 'sites#dashboard'
  resources :events do
    get 'calender', on: :collection
  end
  resources :speakers
  resources :sponsers
end
