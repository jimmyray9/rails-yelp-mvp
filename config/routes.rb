Rails.application.routes.draw do
 
	resources :restaurants do
		resources :reviews, only: [:create, :new, :destroy], shallow:true
	end
end
