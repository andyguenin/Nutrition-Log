Nl::Application.routes.draw do

	get "/home" => "pages#home", :as => :home
  get "/about" => "pages#about", :as => :about
  get "/team" => "pages#team", :as => :team

	get "/search" => "recipes#search", :as => :recipe_search  
	resources :ingredients, :only => [:index, :show, :new, :create]
	resources :users
	resources :recipes

	get '/signup', :to => 'users#new'
	get '/signin', :to => 'sessions#new'
	post '/signin', :to => 'sessions#create'
	get '/signout', :to => 'sessions#destroy'
  match '/profile', :to => 'users#profile'
	root :to => "pages#home"
end
