Rails.application.routes.draw do
  devise_for :users
  get 'home/index'
  get 'dashboard/index'
  namespace :dashboard do
    resources :products, except: [:show]
    resources :tax_classifications, except: [:show]
    resources :families, except: [:show]
    resources :groups, except: [:show]
    resources :manufacturers, except: [:show]
  end
end
