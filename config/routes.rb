Rails.application.routes.draw do
  get 'login'=> 'session#login'
  post "login" => "session#create_login_session"
  delete 'logout'=> 'session#logout'
  # get 'welcome/index'
  resources :orids
  resources :users ,only:[:show,:create,:new]
  root 'welcome#index'
  get 'register'=> 'users#new'
  get 'postorid'=>'orids#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
