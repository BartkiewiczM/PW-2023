Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  devise_scope :user do
    get '/login', to: redirect('/users/auth/google_oauth2'), as: :login
  end

  root to: 'home#index'
  # Other routes go here
end
