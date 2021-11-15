module Api
    module V1
        class SessionsController < FirebaseController
        #既存ユーザー
            # POST /login
            def create
                super do |decoded_token|  #ブロック付きメソッド。メソッドの内部からそのブロックを評価することが可能
                User.find_by(uid: decoded_token['uid'])
                end
            end
            
            # DELETE /logout
            def destroy
                render json: { message: 'ログアウトしました。' }
                super
            end
        end
    end
end

