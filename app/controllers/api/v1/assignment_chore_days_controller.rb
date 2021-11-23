module Api
    module V1
        class AssignmentChoreDaysController < ApplicationController
            before_action :logged_in_user
            before_action :assignment_chore_days_params, only:[:create, :update, :destroy]
            before_action :set_assignment_chore_days, only:[:show, :update, :destroy]

            def index
                survey = Survey.find_by(user_id: @current_user.id)
                # survey = Survey.find_by(user_id: 1)
                wh = survey.working_hours.to_i #就業時間
                pj = survey.partner_jobsituation #パートナー就業状況
                if pj.include?("勤務")
                    pj = '1'
                elsif pj.include?("パート")
                    pj = '2'
                elsif pj.include?("専業")
                    pj = '3'
                else
                    pj = ''
                end

                if wh <= 45 && pj == '1' #wh = 0~45 且つ pj = 1
                    result = AssignmentChoreDay.find(1)
                    render json: { status: 'Success', data: result } 
                elsif (wh >= 46 && wh <= 59) && pj == '1' #wh = 46~59 且つ pj = 1
                    result = AssignmentChoreDay.find(2)
                    render json: { status: 'Success', data: result }
                elsif wh >= 60 && pj == '1' #wh = 60~ 且つ pj = 1
                    result = AssignmentChoreDay.find(3)
                    render json: { status: 'Success', data: result }
                elsif wh <= 45 && (pj == '2' || pj == '3')
                    result = AssignmentChoreDay.find(4)
                    render json: { status: 'Success', data: result }
                elsif (wh >= 46 && wh <= 59) && (pj == '2' || pj == '3')
                    result = AssignmentChoreDay.find(5)
                    render json: { status: 'Success', data: result }
                elsif wh >= 60 && (pj == '2' || pj == '3')
                    result = AssignmentChoreDay.find(6)
                    render json: { status: 'Success', data: result }
                else
                    render json: { status: 'Error', message: "データが正しく取得できませんでした" }
                end
            end
            


            def create
                assignment_chore_days = AssignmentChoreDay.new(assignment_chore_days_params)
                if assignment_chore_days.save
                    render json: { status: 'Success',  data: assignment_chore_days }
                else
                    render json: { status: 'Error',  message: assignment_chore_days.errors.full_messages }
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


