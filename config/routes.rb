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
   resources :users, only: [:show]
  resources :foodstalls do
    resources :store_reservations, only: [:new, :confirmation, :create] do
      collection do
        post :confirmation
      end
    end
    resources :comments, only: [:new, :create]
     member do
       get 'search'
     end
  end
end
