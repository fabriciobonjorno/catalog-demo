Rails.application.routes.draw do
  get 'dashboard/index'
  namespace :dashboard do
    get 'tax_classifications/index'
  end
  namespace :dashboard do
    get 'products/index'
  end
  namespace :dashboard do
    get 'families/index'
  end
  namespace :dashboard do
    get 'groups/index'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
