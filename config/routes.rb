Rails.application.routes.draw do

  resources :events
  post 'reviews/edit', :to => "reviews#edit"
  get 'tutorings/index'
  get 'tutorings/new'
  get 'tutorings/edit'
  get 'tutorings/show'
  get 'tutorings/list'

  post '/rate' => 'rater#create', :as => 'rate'

  get 'fbsessions/create'
  get 'fbsessions/destroy'
  get 'fbsessions/create'
  get 'fbsessions/destroy'
  get 'sessions/create'
  get 'sessions/destroy'

  get 'home/show'

  get "signup", :to => "users#new"
  get "login", :to => "sessions#login"
  get "logout", :to => "sessions#logout"
  get "home", :to => "sessions#home"

  get "setting", :to => "sessions#setting"

  get 'users/list', to: "users#list"
  get 'courses/download', to: "courses#download_request"
  post 'courses/download', to: "courses#download"
  post 'login', :to => "sessions#login_attempt"

  get 'users/new'
  get 'courses/index'
  get 'courses/new'
  get 'posts/index'
  get 'user/profile'
  get 'user/show'
  get 'user/register'
  get 'user/login'
  get 'messageboard/index'
  get 'messageboard/new'
  get 'messageboard/show'

  resources :widgets
  resources :users
  resources :fbsessions
  resources :reviews
  resources :tutorings
  resources :courses do
    member do
      get :subscribe
    end
  end

  # resources :posts
  # Nest posts inside of messageboard
  resources :messageboard do
    resources :posts
    member do
      get :subscribe
    end
  end
  resources :topic do
    resources :posts
  end
  resources :posts do
    resources :posts
    member do
      put "like", to: "posts#upvote"
      put "dislike", to: "posts#downvote"
    end
  end

  resources :notifications do
    collection do
      post :mark_as_read
    end
  end
  scope '/users' do
    resources :conversations do
      resources :messages
    end
  end

  resources :conversations do
    resources :messages
  end

  get 'auth/:provider/callback', to: 'fbsessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'fbsessions#destroy', as: 'signout'

  resources :fbsessions, only: [:create, :destroy]
  resource :home, only: [:show]


  root to: "courses#index"
  get 'calendars', to: 'calendars#index'



  get '/redirect', to: 'fbsessions#redirect', as: 'redirect'
  get '/callback', to: 'fbsessions#callback', as: 'callback'
  # get '/calendars', to: 'fbsessions#calendars', as: 'calendars'


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"



  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
