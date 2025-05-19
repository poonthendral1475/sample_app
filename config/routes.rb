require 'sidekiq/web'

Rails.application.routes.draw do

  get 'sessions/new'
  get 'users/new'

  if Rails.env.production?
  Sidekiq::Web.use Rack::Auth::Basic do |username, password|
    secure_user = Rails.application.credentials[:secure_user]
    secure_pass = Rails.application.credentials[:secure_pass]

    ActiveSupport::SecurityUtils.secure_compare(username, secure_user) &
      ActiveSupport::SecurityUtils.secure_compare(password, secure_pass)
  end
  end

  mount Sidekiq::Web => '/sidekiq'


  root 'static_pages#home'

  get '/help',    to: 'static_pages#help'
  get '/about',   to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'

  get '/signup',  to: 'users#new'
  get '/login',   to: 'sessions#new'
  post '/login',  to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :users # it's create 7 action
end
