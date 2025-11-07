Rails.application.routes.draw do
  root "products#index"

  devise_for :users

  resources :categories
  resources :products do
    collection do
      get :export_csv
      get :export_pdf
    end
  end
  resources :customers
  resources :pets
  resources :veterinarians
  resources :appointments
  resources :orders do
    resources :order_items
  end
end
