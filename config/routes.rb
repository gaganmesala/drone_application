Rails.application.routes.draw do
  
  root 'welcome#index'

  resources :drones do
    member do
      put 'take_off'
      put 'move'
      put 'stabilize'
      put 'land'
      put 'engine_break'
      put 'stop_drone'
      put 'tap_drone'
    end

    collection do
      get 'fly_drone'
    end
  end
  resources :engines
  resources :gyroscopes
  resources :orientation_sensors
end
