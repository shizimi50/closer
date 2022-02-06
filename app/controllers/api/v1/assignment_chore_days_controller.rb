module Api
    module V1
        class AssignmentChoreDaysController < ApplicationController
            before_action :logged_in_user
            before_action :assignment_chore_days_params, only:[:create, :update, :destroy]
            before_action :set_assignment_chore_days, only:[:show, :update, :destroy]

            def index
                result = AssignmentChoreDay.where(user_id: @current_user.id).last
                render json: { status: 'Success', data: result } 
            end
            

            def create
                survey = Survey.where(user_id: @current_user.id).last
                wh = survey.working_hours.to_i #就業時間
                pj = survey.partner_jobsituation #パートナー就業状況

                if wh <= 45 && pj.include?("勤務") #0~45×フルタイム勤務or時短勤務 ＝ 1~1.5hr×平日
                    result = AssignmentChoreDay.create(working_hours: '1~1.5hr', chore_days: '平日', user_id: current_user.id)
                    render json: { status: 'Success', data: result } 
                elsif wh <= 45 && (pj.include?("パート") || pj.include?("専業"))  #0~45×パート(週4以下)OR専業主婦(夫) ＝ 1~1.5hr×休日
                    result = AssignmentChoreDay.create(working_hours: '1~1.5hr', chore_days: '休日', user_id: current_user.id)
                    render json: { status: 'Success', data: result }
                elsif (wh >= 46 && wh <= 59) && pj.include?("勤務")#46~59×フルタイム勤務or時短勤務 ＝ 30mins~1hr×平日
                    result = AssignmentChoreDay.create(working_hours: '30mins~1hr', chore_days: '平日', user_id: current_user.id)
                elsif (wh >= 46 && wh <= 59) && (pj.include?("パート") || pj.include?("専業")) #46~59×パート(週4以下)OR専業主婦(夫) ＝ 30mins~1hr×休日
                    result = AssignmentChoreDay.create(working_hours: '30mins~1hr', chore_days: '休日', user_id: current_user.id)
                    render json: { status: 'Success', data: result }
                elsif wh >= 60 && pj.include?("勤務") #60~×フルタイム勤務or時短勤務 = 15mins~30mins×平日
                    result = AssignmentChoreDay.create(working_hours: '15mins~30mins', chore_days: '平日', user_id: current_user.id)
                    render json: { status: 'Success', data: result }
                elsif wh >= 60 && (pj.include?("パート") || pj.include?("専業")) #60~×パート(週4以下)OR専業主婦(夫) = 15mins~30mins×休日
                    result = AssignmentChoreDay.create(working_hours: '15mins~30mins', chore_days: '休日', user_id: current_user.id)
                    render json: { status: 'Success', data: result }
                else
                    render json: { status: 'Error', message: "おすすめ家事日時を登録できませんでした" }
                end

            end

            private
            
            def assignment_chore_days_params
                params.permit(:working_hours, :chore_days)
            end

            def set_assignment_chore_days
                @assignment_chore_days = AssignmentChoreDay.find(params[:id])
            end


        end
    end
end


