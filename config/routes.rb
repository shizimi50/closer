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
        collection do
          get :my_todos 
          get :recommend_todos 
          post :recommend_results 
          get :today 
          get :week 
        end
        resources :chore_ways
        resources :chore_tools
      end

      resources :assignment_chore_days, only: [:index, :create]
      get 'assignment_chore_days' => 'assignment_chore_days#assignment_chore_days'

    end
  end

end
