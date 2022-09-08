Rails.application.routes.draw do
  get 'dashboards/index', as: :dashboards
  get 'posts/:id', to: 'posts#show'
  resources :logins, only: [:new, :create]
  resources :registrations, only: [:new, :create]
  resources :posts, only: [:new, :create, :update, :edit]
end
