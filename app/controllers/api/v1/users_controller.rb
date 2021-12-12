module Api
    module V1
        class UsersController < ApplicationController

            before_action :logged_in_user

            def index
              @users = User.all
            end

            # Mypage（現在の登録家事件数／おすすめ担当日時）
            def about
                user = User.find_by(id: current_user.id)
                count = Chore.where(user_id: user.id).count
                assignment_chore_day = AssignmentChoreDay.where(user_id: user.id)
                # render json: user, each_serializer: UserSerializer, include: [ :assignment_chore_days ]
                # render json: user, each_serializer: UserSerializer

                render json: {user: user, count: count, assignment_chore_day: assignment_chore_day}
            end
            
        end
    end
end