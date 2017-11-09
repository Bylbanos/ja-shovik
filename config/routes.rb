Rails.application.routes.draw do
  resources :photos

  get 'welcome/index'

  resources :articles do
    resources :comments
  end
  root 'welcome#index'
end
