Rails.application.routes.draw do
  get 'sessions/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users do
    resources:accounts do 
      resources :transactions
    end
  end
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  root 'sessions#new'
  post '/approve', to: 'transactions#approve'
  get   '/unauthorize', to: 'unauthorizes#new'
end
