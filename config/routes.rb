Rails.application.routes.draw do


  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, path: '', path_names: {sign_in: 'login', sign_out: 'logout', edit: 'profile'},
             controllers: {omniauth_callbacks: "omniauth_callbacks"}

  # mms: since I'm discussing (pushing for) RESTful routes everywhere else, it's important to note that this is a known, acceptable exception.
  # mms:   Why?  The "RESTful" solution would be "about#show", "contact#show", etc.  A relatively empty controller for each page, which is unlikely to ever use the other actions.
  # mms:   "About" is not a "resource".
  get 'pages/about', to: 'pages#about'
  # mms: recommend a delimiter '/my_courses', though I'm unclear why this is any better than '/courses'
  get '/mycourses' => 'courses#list'
  # mms: why is this better than 'registrations#create'?  Stick to RESTful routes whenever possible.
  post '/register',  to: 'registrations#register'


  # home
  root "courses#index"

  resources :courses do
    resources :lessons, only: [:show]
  end

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
