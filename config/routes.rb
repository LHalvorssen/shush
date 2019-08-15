Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'dashboard#index'

  get 'chatroom', to: 'chatroom#index'
  
  get 'login', to: 'sessions#new'

  post 'signup', to: 'sessions#sign_up'

  post 'login', to: 'sessions#create'

  delete 'logout', to: 'sessions#destroy'
  
  post 'message', to: 'messages#create'

  mount ActionCable.server, at: '/cable'

end
