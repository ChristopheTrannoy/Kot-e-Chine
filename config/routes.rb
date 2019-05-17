Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'welcome#index'
  resources :events
  resources :articles do
    resources :comments
  end
  resources :users, only: [:new, :show, :create] do
    member do
      get 'confirm'
    end
  end
end
