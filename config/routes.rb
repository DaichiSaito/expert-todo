Rails.application.routes.draw do
  get 'attachments/create'

  get 'attachments/destroy'

  devise_for :users
  resources :tasks
  
  authenticated :user do
    resources :tasks
    root to: "tasks#index"
  end

  root to: "static_pages#home"
end
