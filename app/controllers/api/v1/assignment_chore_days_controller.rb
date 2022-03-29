module Api
    module V1
        class AssignmentChoreDaysController < ApplicationController
            before_action :logged_in_user
            before_action :assignment_chore_days_params, only:[:create]

            def index
                result = AssignmentChoreDay.where(user_id: @current_user.id).last
                render json: { data: result } 
            end

            def create
                survey = Survey.where(user_id: @current_user.id).last
                wh = survey.working_hours #就業時間
                pj = survey.jobsituation_id #パートナー就業状況

                if wh <= 45 && pj == 1 #0~45×フルタイム勤務or時短勤務 ＝ 1~1.5hr×平日
                    result = current_user.assignment_chore_days.build(working_hours: '1~1.5hr', chore_days: '平日')
                elsif wh <= 45 && (pj == 2 || pj == 3)  #0~45×パート(週4以下)OR専業主婦(夫) ＝ 1~1.5hr×休日
                    result = current_user.assignment_chore_days.build(working_hours: '1~1.5hr', chore_days: '休日')
                elsif (wh >= 46 && wh <= 59) && pj == 1#46~59×フルタイム勤務or時短勤務 ＝ 30mins~1hr×平日
                    result = current_user.assignment_chore_days.build(working_hours: '30mins~1hr', chore_days: '平日')
                elsif (wh >= 46 && wh <= 59) && (pj == 2 || pj == 3) #46~59×パート(週4以下)OR専業主婦(夫) ＝ 30mins~1hr×休日
                    result = current_user.assignment_chore_days.build(working_hours: '30mins~1hr', chore_days: '休日')
                elsif wh >= 60 && pj == 1 #60~×フルタイム勤務or時短勤務 = 15mins~30mins×平日
                    result = current_user.assignment_chore_days.build(working_hours: '15mins~30mins', chore_days: '平日')
                elsif wh >= 60 && (pj == 2 || pj == 3) #60~×パート(週4以下)OR専業主婦(夫) = 15mins~30mins×休日
                    result = current_user.assignment_chore_days.build(working_hours: '15mins~30mins', chore_days: '休日')
                else
                    render json: { status: 'Error', message: "おすすめ家事日時を表示できませんでした" }
                end

                if result.save
                    render json:  {data: result }
                else
                    render json: { message: result.errors.full_messages }
                end
            end

            private

            def assignment_chore_days_params
                params.permit(:working_hours, :chore_days, :user_id)
            end

        end
    end
end


