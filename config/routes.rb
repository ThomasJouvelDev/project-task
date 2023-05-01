Rails.application.routes.draw do
  get "/generate_recurring_task", to: "dashboard#generate_recurring_tasks_tasks"

  resources :tasks
  resources :recurring_tasks
  resources :goals do
    member do
      resources :goal_tasks, only: %i[new create]
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "dashboard#index"
end
