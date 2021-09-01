Rails.application.routes.draw do
  devise_for :owners, controllers: {
    sessions:      'owners/sessions',
    passwords:     'owners/passwords',
    registrations: 'owners/registrations'
  }
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }
   root to: 'foodstalls#index'
  get 'foodstalls/search'
  resources :store_reservations
  resources :foodstalls do
    resources :comments
     member do
       get 'search'
     end
  end
end
