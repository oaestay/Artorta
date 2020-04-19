Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :wedding_toppings, :path => 'cupulas'

  root 'pages#home'
  resources :cakes, :path => 'productos' do
    get :autocomplete_tag_name, :on => :collection
  end

  get 'buscar'       =>   'cakes#search', as: :search
  get 'catalogo'     =>   'cakes#catalog', as: :catalog
  get 'subcatalogo'  =>   'cakes#cakes_tagged_with', as: :subcategory
  get 'despacho'     =>   'pages#delivery', as: :delivery
  get 'prensa'       =>   'pages#press', as: :press
  get 'empresas'     =>   'pages#companies', as: :companies
  get 'comprar'      =>   'pages#buy', as: :buy
  get 'sabores'      =>   'pages#flavours', as: :flavours
  get 'ubicacion'    =>   'pages#location', as: :location
  get 'nosotros'     =>   'pages#us', as: :us
  get 'mail_test'    =>   'pages#mail_test', as: :mail_test
end
