Nl::Application.routes.draw do

	get "/home" => "pages#home", :as => :home
  get "/about" => "pages#about", :as => :about
  get "/team" => "pages#team", :as => :team

	get "/search" => "recipes#search", :as => :recipe_search  
	get "/recipes/:id/consume" => "recipes#consume", :as => :consume_recipe
	get "/remove_log_item/:lrid" => "users#remove_log_item", :as => :delete_logged_recipe
	resources :ingredients, :only => [:index, :show, :new, :create]
	resources :users
	resources :recipes
	get "/ingsearch" => "ingredients#search", :as => :ingredient_search
	get '/recipes/:id/ing/:ingredient_id' => "recipes#addingredient", :as => :ingredient_add
	get '/signup', :to => 'users#new'
	get '/signin', :to => 'sessions#new'
	post '/signin', :to => 'sessions#create'
	get '/signout', :to => 'sessions#destroy'
  match '/profile', :to => 'users#profile'
	root :to => "pages#home"
end
