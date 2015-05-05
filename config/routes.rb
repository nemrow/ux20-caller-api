Rails.application.routes.draw do

  resource :search, only: ["create", "show"]

  post "status_callback", to: "call_handler#status_callback"
  post "init_call", to: "call_handler#init_call"
  post "goodbye_callback", to: "call_handler#goodbye_callback"
  post "trascribe_callback", to: "call_handler#trascribe_callback"

  get "test", to: "call_handler#test"

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
end
