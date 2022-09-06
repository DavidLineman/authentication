Rails.application.routes.draw do
  get 'posts/new'
  get 'posts/create'
  get 'posts/edit'
  get 'dashboards/index', as: :dashboards
  resources :logins, only: [:new, :create]
  resources :registrations, only: [:new, :create]
end
