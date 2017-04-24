Rails.application.routes.draw do
  get 'home/index'

  devise_for :users, controllers:{registrations: 'registrations'}
  devise_scope :user do
    root to: 'home#index'
  end

  get '/chat/index'
  get '/chat/load_conversation/:id', to: 'chat#load_conversation'
  post '/chat/send_message/:id', to: 'chat#send_message'

  get '/user/index'

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

#last-end-anchor
end
