Rails.application.routes.draw do
  resources :tasks
  resources :goals do
    member do
      resources :goal_tasks, only: %i[new create]
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "dashboard#index"
end
