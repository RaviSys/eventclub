class ActionDispatch::Routing::Mapper
  def draw(routes_name)
    instance_eval(File.read(Rails.root.join("config/routes/#{routes_name}.rb")))
  end
end

Rails.application.routes.draw do
  root 'home#index'
  resources :events, only: [:index, :show]
  get '/search_events' => "home#search_events"  
  get 'tags/:tag', to: 'home#tagged_events', as: :tag

  draw :admin

end
