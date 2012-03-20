Nl::Application.routes.draw do
	get "/home" => "pages#home", :as => :home
  get "/about" => "pages#about", :as => :about
  get "/team" => "pages#team", :as => :team

	resources :sessions, :only => [:new, :create, :destroy]
  resources :users

	match '/signup', :to => 'users#new'	
	match '/signin', :to => 'sessions#new'
	match '/signout', :to => 'sessions#destroy'

	root :to => "pages#home"
end
