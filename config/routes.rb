Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users

  authenticated :user do
    match "/delayed_job" => DelayedJobWeb, :anchor => false, via: [:get, :post]
  end

  devise_scope :user do
    get '/registration/:token' => 'users#register_form', as: :register
    put '/registration/:token' => 'users#finish_creating', as: :finish
  end

  post 'gateway' => 'gateway#send_message'
end
