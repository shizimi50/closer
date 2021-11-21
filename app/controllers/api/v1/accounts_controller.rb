module Api
    module V1
        class AccountsController < FirebaseController

            # POST /accounts
            def create
                super do |decoded_token|
                User.create(
                    email: decoded_token['decoded_token'][:payload]['email'],
                    uid:   decoded_token['uid'],
                    name:  decoded_token['decoded_token'][:payload]['name']
                )
                end
            end
            
            # DELETE /accounts
            def destroy
                current_user.destroy
                render json: { message: 'アカウント削除しました' }
                # flash[:danger] = 'アカウント削除しました。'
                super
            end

        end
    end
end


