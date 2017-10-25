Rails.application.routes.draw do
  get 'challenges/index'
  get 'challenges/save_checkbox'

  get 'welcome/index'

  resources :articles do
    resources :comments
  end
  
  root 'welcome#index'
end
