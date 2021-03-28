Rails.application.routes.draw do
  get 'dashboard/index'
  namespace :dashboard do
    resources :products
    resources :tax_classifications
    resources :families
    resources :groups
  end
end
