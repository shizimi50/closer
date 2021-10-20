module Api
    module V1
        class FirebaseController < ApplicationController
          before_action :logged_in_user, only: [:destroy]

            def create
                if decoded_token = authenticate_firebase_id_token
                  user = yield(decoded_token)
                  log_in(user)
                  render json: { message: 'ログインしました。' }
                  # flash[:success] = 'ログインしました。'
                  # redirect_back_or(users_path)
                else
                  render json: { message: 'ログインできませんでした。' }
                  # flash[:danger] = 'ログインできませんでした。'
                  # redirect_to login_url
                end
            end
            
        end
    end
end


