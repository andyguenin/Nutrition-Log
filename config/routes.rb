Nl::Application.routes.draw do

	get "/home" => "pages#home", :as => :home
  get "/about" => "pages#about", :as => :about
  get "/team" => "pages#team", :as => :team

  scope '/profile' do
		resources :ingredients, :module => :user
#		resources :logs
	end

	resources :users
#	resources :ingredients
#	resources :recipes

	get '/signup', :to => 'users#new'
	get '/signin', :to => 'sessions#new'
	post '/signin', :to => 'sessions#create'
	get '/signout', :to => 'sessions#destroy'
  match '/profile', :to => 'users#profile'
	root :to => "pages#home"
end
