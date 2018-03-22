Rails.application.routes.draw do
	root 'words#welcome'
	get 'index' , to: 'words#index'

	get 'login' , to: 'users#sign_up'
	delete 'logout' , to: 'users#destroy'
	post 'login' , to: 'users#login'

	#get 'sign' , to: 'users#new'
	#post 'sign' , to: 'users#create'

	resources :words

	resources :users do
		get :sign, on: :member
	end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
