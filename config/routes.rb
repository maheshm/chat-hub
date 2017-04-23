Rails.application.routes.draw do
  get 'home/index'

  devise_for :users
  devise_scope :user do
    root to: 'home#index'
  end

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

#last-end-anchor
end
