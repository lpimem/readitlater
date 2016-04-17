Rails.application.routes.draw do
  
  devise_for :accounts
  resources :followships
  resources :ratings
  resources :accounts
  resources :links


  get 'search', to: 'links#search'
  get 'filter_following', to: 'links#filter_following'

  devise_scope :account do
    authenticated :account do
     root to: "static_pages#home", as: :authenticated_root
     resources :links
     resources :reports
     get 'report/:id', to: 'reports#new', as: :report_link
    end

    unauthenticated do
     root to: "static_pages#home", as: :unauthenticated_root
    end

  end



  # routes for Lijiatest page

  get 'lijiatest' , to: 'static_pages#lijiatest', as:"lijiatest";

  # get "accounts" , to: "accounts#index", as: "accounts_index";
  get "/links/list" , to: "links#list", as: "links_list";
  get "/ratings/list" , to: "ratings#list", as: "ratings_list";
  get "/followships/list" , to: "followships#list", as: "followships_list";

  # get '/accounts/index', to: 'accounts#index', as: 'account_index'
  # post '/accounts/index', to: 'accounts#index'

  # get '/links/index', to: 'links#index', as: 'link_index'
  # post '/links/index', to: 'links#index'

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
  #   resources photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
