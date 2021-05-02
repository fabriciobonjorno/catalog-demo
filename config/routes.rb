Rails.application.routes.draw do
  devise_for :users
  root "home#index"
  get "home/home"
  get "home/index"
  get "group/product/:id", to: "products#show", as: :product
  get "group/:id", to: "groups#show", as: :group
  get "dashboard", to: "dashboard#index"

  namespace :dashboard do
    resources :products, except: [:show]
    resources :tax_classifications, except: [:show]
    resources :families, except: [:show]
    resources :groups, except: [:show]
    resources :manufacturers, except: [:show]
    resources :users, except: [:show]
    resources :companies, only: [:edit, :index, :update]
  end
end
