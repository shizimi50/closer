module Api
    module V1
        class FirebaseController < ApplicationController
          before_action :logged_in_user, only: [:destroy]

            def create
                if decoded_token = authenticate_firebase_id_token
                  user = yield(decoded_token)
                  log_in(user)
                  render json: { message: 'ログインしました。', data: {user: user, decoded_token: decoded_token} }
                elsif 
                  render json: { message: 'BearerToken に値が入っていません' }, status: 401
                else
                end
            end
            
        end
    end
end


