Rails.application.routes.draw do
  root "posts#index"
  resources "posts"

  # For Generating Sub-Category
  resources :categories do
    member do
      get :get_subcategories, defaults: { format: "js" }
      resources :comments, only: [:create, :destroy]
    end
  end
end
