RgfNew::Application.routes.draw do
  get "mailbox/index"
  #get "messages/show"
  #get "sent/index"
  #get "sent/show"
  get "events/update_events"

  resources :sent
  resources :mailbox, :collection => { :trash => :get }

 # resources :mailbox do 
 #   get :trash, :on => :collection
 # end

  resources :messages, :member => { :reply => :get, :forward => :get, :reply_all => :get, :undelete => :put }



  resources :event_categories
  resources :groups
  resources :profiles
  resources :locations
  resources :events
  resources :food_categories
  resources :eat_by_dates
  resources :values
  

 resources :listings do
    get :autocomplete_food_category_name, :on => :collection
  collection do
    get  :search
    post :on_offer
  end
 end


  #devise_for :users
 # devise_for :users do 
 #    get 'logout' => 'devise/sessions#destroy'
 # end

  devise_for :users do 
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :posts do
    resources :comments
  end

  resources :comments
  #get "listings/search"	
  match 'listings/:id', :to => 'listings#search'
  match 'inbox', :to => 'mailbox#index'
  #match '/contact', :to => 'pages#contact'
  get "home/index"
  get 'listings/autocomplete_food_category_name'
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
   root :to => "home#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
