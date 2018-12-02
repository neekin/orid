Rails.application.routes.draw do
  get 'login'=> 'session/login'
  get 'logout'=> 'session/logout'
  get 'welcome/index'
  resources :orids
  resources :users
  root 'welcome#index'
  get 'register'=> 'users#new'
  get 'postorid'=>'orids#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
