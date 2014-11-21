RailsRssReader::Application.routes.draw do
  
  root 'sessions#login'
  #match ':controller(/:action(/:id))(.:format)', via: :get
  
  #get "sessions/login," => "sessions#login"
  #get "sessions/home," => "sessions#home"
  #get "sessions/profile," => "sessions#profile"
  #get "sessions/setting" => "sessions#setting"
  #get "sessions/signup" => "user#new"
  #match "/signup", to: "users#new", via: "get", as: "signup"
 # match "/login", to: "users#new", via: "get", as: "login"
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".


  match ':controller(/:action(/:id))(.:format)', via: :get
  
  match "signup", :to => "users#new", :via => [:get]
  match "login", :to => "sessions#login", :via => [:get]
  match "logout", :to => "sessions#logout", :via => [:get]
  match "home", :to => "sessions#home", :via => [:get]
  post "/sessions/login_attempt", to: "sessions#login_attempt"
  #match "user/create/:id", :to => "users#create", :via => [:get]
  match "profile", :to => "sessions#profile", :via => [:get]
  match "setting", :to => "sessions#setting", :via => [:get]
  #match "feeds", :to => "sessions#home", :via => [:get], as: "feeds"
  #match "add_feed", :to => "sessions#add_feed", :via => [:post]
  #match "feed_articles", :to => "feeds/feed_articles", :via => [:get]
  match "feed/:id/edit", :to => "feeds#edit", :via => [:get]
  match "feed/:id/edit", :to => "feeds#update", :via => [:post]

  resources :users do
    post :login, :on => :collection
  end

  resources :feeds
  
  # You can have the root of your site routed with "root"
  #root 'welcome#index'

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
