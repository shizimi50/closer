Rails.application.routes.draw do
  # Frontend Rooting
  root to: 'home#index'
  # root to: 'users#login'
  get 'login' => 'users#login'
  get 'signup' => 'users#signup'
  get 'resetpassword' => 'users#resetpassword'
  get 'dashboard' => 'dashboard#index'
  get 'sample' => 'users#sample'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # Baclend Rooting
  namespace :api do
    namespace :v1 do
      
      post 'login' => 'sessions#create'
      delete '/logout'   => 'sessions#destroy'
      post   '/accounts' => 'accounts#create'
      delete '/accounts' => 'accounts#destroy'

      resources :users do
        collection do
          get :about
        end
      end

      resources :surveys, only: [:index, :create]

      resources :chores do
        collection do
          get :my_todos 
          get :recommend_todos 
          post :recommend_results 
          get :today 
          get :week
          put :remove_todo
        end
        resources :chore_ways
        resources :chore_tools
      end

      resources :assignment_chore_days, only: [:index, :create] do 
        collection do
          get :assignment_chore_days
        end
      end

    end
  end

end
