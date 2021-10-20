Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      
      post 'login' => 'sessions#create'
      delete '/logout'   => 'sessions#destroy'
      post   '/accounts' => 'accounts#create'
      delete '/accounts' => 'accounts#destroy'

      resources :users
      resources :surveys, only: [:index, :create]

      resources :chores do
        resources :chore_ways
        resources :chore_tools
      end
      get 'chore_ways/recommend_tasks' => 'chore_ways#recommend_task'

      resources :assignment_chore_days, only: [:index, :create]
      get 'assignment_chore_days' => 'assignment_chore_days#assignment_chore_days'

    end
  end

end
