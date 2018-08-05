Rails.application.routes.draw do
   #get 'sessions/new'

   #get 'users/new'

   root   'static_pages#home'
   get    '/help',    to: 'static_pages#help'
   get    '/about',   to: 'static_pages#about'
   get    '/contact', to: 'static_pages#contact'
   get    '/signup',  to: 'users#new'
   get    '/login',   to: 'sessions#new'
   post   '/login',   to: 'sessions#create'
   delete '/logout',   to: 'sessions#destroy'
   resources :users do
      member do
         get :following, :followers
      end
   end

   #resources :microposts
   #resources :users
   resources :microposts, only: [:create, :destroy] #13.30
   resources :relationships, only: [:create, :destroy]   #14.20
end
