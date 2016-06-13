Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  devise_scope :user do
    get 'login', to: 'users/sessions#new'
    get 'signup', to: 'users/registrations#new'
  end

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
