Rails.application.routes.draw do
	root 'words#welcome'
	get 'index' , to: 'words#index'
	resource :words
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
