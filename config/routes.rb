RgfNew::Application.routes.draw do

  resources :member_attending_event_registers

  root :to => "home#index"

  get "events/update_events"
  get "home/index"
  get "listings/tag/"
  get "listings/add_to_event"
  post 'member_attending_event_registers/accept', :as => 'accept'
  post 'member_attending_event_registers/reject', :as => 'reject'

  resources :mailbox	
  resources :dashboards
  resources :sent

  resources :messages do
   get :reply, :on => :member
   get :forward, :on => :member
   get :reply_all, :on => :member
   put :undelete,  :on => :member
  end

  resources :event_categories
  resources :groups
  resources :profiles

  resources :locations do 
    collection do
        get  :search
    end 
  end

  resources :events do
     member do
       get  :event_attendence
     end
  end
  resources :food_categories
  resources :eat_by_dates
  resources :values
  resources :comments

 resources :listings do
    get :autocomplete_food_category_name, :on => :collection
  collection do
    get  :search
    post :on_offer
  end
 end



  devise_for :users, :controllers => { :registrations => "registrations" } do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :posts do
    resources :comments
  end

   match "/inbox" => "mailbox#index", :as => :inbox
   match "/sent" => "sent#index", :as => :sent
   match "/trash" => "mailbox#trash", :as => :trash

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

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
