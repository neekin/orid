Rails.application.routes.draw do

  resources :messages do
    collection do
      get :events
    end
  end
  get 'login'=> 'session#login'
  post "login" => "session#create_login_session"
  delete 'logout'=> 'session#logout'
  # get 'welcome/index'
  resources :orids do
    member do
      get 'public' => 'orids#update'
    end
  end
  resources :users ,only:[:show,:create,:new,:update] do
    member do
      get 'changepassword' => 'users#show' #url /posts/:id/actionname 生成一个成员的路由
      get 'myorids' =>'users#show'
    end
  end
  root 'welcome#index'
  get 'register'=> 'users#new'
  # post 'register'=>'users#create'
  get 'postorid'=>'orids#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
