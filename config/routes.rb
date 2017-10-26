Rails.application.routes.draw do
  get 'recibir/sms'

  devise_for :users

  resources :contactos, only: [:new, :create, :show, :index]

  mount ActionCable.server => '/cable'

  root 'contactos#index'

  get   '/contactos/ver/:id'      => 'contactos#ver',       as: 'ver'
  get   '/recibir/'               => 'recibir#sms',         as: 'recibir'

end
