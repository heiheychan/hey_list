Rails.application.routes.draw do
  root "posts#index"
  # Devise Users and user-related pages
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'login', to: 'users/sessions#new'
    get 'signup', to: 'users/registrations#new'
    get 'update', to: 'users/registrations#edit'
  end

  get 'profile', to: 'profile#index'
  resources "posts"  do
    resources :images, :only => [:create, :destroy]
  end
  # For Generating Sub-Category
  resources :categories do
    member do
      get :get_subcategories, defaults: { format: "js" }
      resources :comments, only: [:create, :destroy]
    end
  end
  # Error handling
  get 'error', to: 'static_pages#error'
  get 'about_us', to: 'static_pages#about_us'
  match "*missing" => redirect("/error"), via: :get
end
