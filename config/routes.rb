# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  get 'dashboard', to: 'dashboard#index'
  get 'dashboard/search'

  namespace :dashboard do
    resources :products, except: [:show]
    resources :tax_classifications, except: [:show]
    resources :families, except: [:show]
    resources :groups, except: [:show]
    resources :manufacturers, except: [:show]
    resources :users, except: [:show]
    resources :companies, only: %i[edit index update]
    resources :layoutpdf, except: [:show]
  end

  # get 'group/:id', to: 'groups#show', as: :group
  # get 'group/:group_id/products/:id', to: 'products#show', as: :product
  resources :groups, only: %i[show] do
    resources :products, only: %i[show]
  end
end
