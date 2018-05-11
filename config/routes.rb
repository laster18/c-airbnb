Rails.application.routes.draw do
  devise_for :users
  # devise_for :users, controllers: {registrations: 'registrations'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'rooms#index'
  resources :rooms, only: [:index, :show, :new, :create] do
    collection do
      get 'room'
      post 'bedrooms'
      post 'bathrooms'
      post 'location'
      post 'amenities'
      post 'spaces'
      post 'first_step_finish'
    end
    member do
      get 'room_review'
      get 'bedrooms'
      get 'bathrooms'
      get 'location'
      get 'amenities'
      get 'spaces'
    end
  end
  resources :users, only: [:edit, :update] do
    collection do
      get 'avatar'
    end
  end
end
