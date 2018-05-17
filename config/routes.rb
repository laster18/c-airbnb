Rails.application.routes.draw do
  devise_for :users
  # devise_for :users, controllers: {registrations: 'registrations'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'rooms#index'

  resources :rooms, only: [:index, :show, :new, :create] do
    resources :room_calendars, only: [:index, :create]
    delete '/room_calendars' => 'room_calendars#destroy'
    resources :room_appointments, only: [:index, :new, :create]

    collection do
      get  'room_type'
      get  'has_rooms_list'
      post 'bedrooms'
      post 'bathrooms'
      post 'location'
      post 'amenities'
      post 'spaces'
      post 'first_step_finish'
    end
    member do
      get 'room_type'
      get 'confirmation'
      get 'bedrooms'
      get 'bathrooms'
      get 'location'
      get 'amenities'
      get 'spaces'
      get 'photos'
      get 'description'
      get 'fee'
      post 'photos_create'
      patch 'availability_questions'
      patch 'availability_settings'
      patch 'title'
      patch 'second_step_finish'
      patch 'bedrooms'
      patch 'bathrooms'
      patch 'location'
      patch 'amenities'
      patch 'spaces'
      patch 'first_step_finish'
      patch 'third_step_finish'
    end
  end

  resources :users, only: [:edit, :update] do
    collection do
      get 'avatar'
    end
  end
end
