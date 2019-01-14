Rails.application.routes.draw do
  devise_for :users,
             path: '',
             path_names: {
               sign_in: 'login',
               sign_out: 'logout',
               registration: 'signup'
             },
             controllers: {
               sessions: 'sessions',
               registrations: 'registrations'
             }
  
  resources :users, only: [:show, :update]
  
  resources :sold_books, only: [:index, :show]
  resources :bought_books, only: [:index, :show]
  resources :pending_books, only: [:index, :show]
  resources :selling_books, except: [:edit, :new]
  resources :transactions, only: [:index]
  resources :search, only: [:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
