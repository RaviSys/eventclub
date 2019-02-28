namespace :admin do
  get 'dashboard' => 'sites#dashboard'
  resources :events
  resources :speakers
  resources :sponsers
end
