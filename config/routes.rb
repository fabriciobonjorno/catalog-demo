Rails.application.routes.draw do
  devise_for :users
  root "home#index"
  get "dashboard", :to => "dashboard#index"
  get "group/:id", :to => "groups#show", :as => :group
  get ":group_id/:id", :to => "products#show", :as => :product

  namespace :dashboard do
    resources :products, :except => [:show]
    resources :tax_classifications, :except => [:show]
    resources :families, :except => [:show]
    resources :groups, :except => [:show]
    resources :manufacturers, :except => [:show]
    resources :users, :except => [:show]
    resources :companies, :only => [:edit, :index, :update]
  end
end
