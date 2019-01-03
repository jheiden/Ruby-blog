Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'articles#index' # changes root ("home") to article index list
  resources :articles do
    resources :comments
end
  resources :tags
  resources :author_sessions, only: [ :new, :create, :destroy ]
  get 'about' => 'pages#about'
  get 'login' => 'author_sessions#new' # invokes the <new> method of the controller ( => = alias to author_session action)
  get 'logout' => 'author_sessions#destroy' # invokes the <destroy> method of the controller (=> =alias to author_session action)
  
  resources :authors
end

