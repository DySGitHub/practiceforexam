Rails.application.routes.draw do
      root 'static_pages#home'
      get  '/help',    to: 'static_pages#help'
      get  '/about',   to: 'static_pages#about'
      get  '/contact', to: 'static_pages#contact'
      get  '/signup',  to: 'users#new'
      resources :users 
<<<<<<< c1d4ec6b3d9de6a5800eab220d35830a099fd1bc
     get    '/login',   to: 'sessions#new'
      post   '/login',   to: 'sessions#create'
      delete '/logout',  to: 'sessions#destroy'
=======
    resources :microposts, only: [:create, :destroy]
>>>>>>> User microposting feature
end
