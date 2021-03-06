Rails.application.routes.draw do

  resources :comments
  resources :profiles
  devise_for :accounts, controllers: { registrations: "registrations" }
  resources :followships
  resources :ratings
  resources :accounts
  resources :links


  get 'search', to: 'links#search'
  get 'filter_following', to: 'links#filter_following'

  # get "view_comments", to: "comments#new"
  get 'profile', to: 'profiles#index'

  devise_scope :account do
    authenticated :account do
     root to: "links#index", as: :authenticated_root
     resources :links
     resources :reports
     get 'report/new/:id', to: 'reports#new', as: :report_link
    end

    unauthenticated do
     root to: "links#index", as: :unauthenticated_root
     #get 'profile', to: 'static_pages#profile',as: 'profile'
    end

  get 'rateup', to: 'ratings#rateup'
  end

  # should be at bottom-- for default page
  # root to: "static_pages#home"

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
