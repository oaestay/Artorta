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
  get 'despacho'     =>   'pages#delivery', as: :delivery
  get 'prensa'       =>   'pages#press', as: :press
  get 'empresas'     =>   'pages#companies', as: :companies
  get 'comprar'      =>   'pages#buy', as: :buy
  get 'sabores'      =>   'pages#flavours', as: :flavours
  get 'ubicacion'    =>   'pages#location', as: :location
  get 'nosotros'     =>   'pages#us', as: :us
end
