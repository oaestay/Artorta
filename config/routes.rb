Rails.application.routes.draw do
  resources :companies, :path => 'empresas'
  resources :presses, :path => 'prensa'
  resources :wedding_toppings, :path => 'cupulas'
  resources :deliveries, :path => 'despacho'

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

  root 'welcome#index'
  devise_for :users
  resources :cakes, :path => 'productos' do
    get :autocomplete_tag_name, :on => :collection
  end

  get 'buscar'       =>   'cakes#search', as: :search
  get 'catalogo'     =>   'cakes#catalog', as: :catalog
  get 'subcatalogo'  =>   'cakes#cakes_tagged_with', as: :subcategory
  get 'comprar'      =>   'pages#buy', as: :buy
  get 'sabores'      =>   'pages#flavours', as: :flavours
  get 'ubicacion'    =>   'pages#location', as: :location
  get 'nosotros'     =>   'pages#us', as: :us
  get 'cakemapping'  =>   'pages#cakemapping', as: :cakemapping
  get 'mail_test'    =>   'pages#mail_test', as: :mail_test
end
