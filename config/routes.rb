Nl::Application.routes.draw do

	get "/home" => "pages#home", :as => :home
  get "/about" => "pages#about", :as => :about
  get "/team" => "pages#team", :as => :team

  
	resources :ingredients, :only => [:index, :show]

	scope '/profile' do
		resources :ingredients, :module => :users, :only => [:index, :create, :new]
		resource :users, :path => '', :only => [:edit, :update]
#		resources :logs
	end

	resources :users, :except => [:edit, :update]
#	resources :recipes

	get '/signup', :to => 'users#new'
	get '/signin', :to => 'sessions#new'
	post '/signin', :to => 'sessions#create'
	get '/signout', :to => 'sessions#destroy'
  match '/profile', :to => 'users#profile'
	root :to => "pages#home"
end
