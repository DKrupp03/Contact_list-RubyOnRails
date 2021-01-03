Rails.application.routes.draw do

  #define a página inicial da aplicação = a página root
  root to: "static_pages#index"

  get 'sobre', to: 'static_pages#sobre'
  get 'contato', to: 'static_pages#contato'

  get 'entrar', to: 'sessions#new'
  post 'entrar', to: 'sessions#create'
  delete 'sair', to: 'sessions#destroy'

  #get 'cadastro', to: 'users#new'

  #usuário só vai poder acessar as páginas new, create e show
  resources :users, only: [:new, :create, :show, :edit, :update]
  resources :contacts

end
