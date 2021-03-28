Rails.application.routes.draw do
  get 'dashboard/index'
  namespace :dashboard do
    resources :products, except: [:show]
    resources :tax_classifications, except: [:show]
    resources :families, except: [:show]
    resources :groups, except: [:show]
  end
end
