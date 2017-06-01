Rails.application.routes.draw do
	# *************** LIST ROUTES *****************
	post 'lists/:id' => 'lists#create'


	# *************** SONG ROUTES *****************
	get '/songs' => 'songs#index'

	post '/songs' => 'songs#create'

	get '/songs/:id' => 'songs#show'

	# patch '/songs/:id' => 'songs#update'

	# *************** USER ROUTES *****************
	root 'users#index'

	post '/login' =>'users#login'

	post '/register' => 'users#register'

	get '/logout' => 'users#logout'

	get '/users/:id' => 'users#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
