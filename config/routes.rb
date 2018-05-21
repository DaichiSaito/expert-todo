Rails.application.routes.draw do
  get 'attachments/create'

  get 'attachments/destroy'

  # / でアクセスした時はstatic_pagesコントローラーのhomeアクション
  root 'static_pages#home'

  devise_for :users
  resources :tasks
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
