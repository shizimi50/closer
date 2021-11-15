module Api
    module V1
        class AssignmentChoreDaysController < ApplicationController
            before_action :assignment_chore_days_params, only:[:create, :update, :destroy]
            before_action :set_assignment_chore_days, only:[:show, :update, :destroy]

            def index
                wh = params[:working_hours] #就業時間
                pj = params[:partner_jobsituation] #パートナー就業状況

                if wh == '1' && pj == '1'
                    assignment_chore_days = AssignmentChoreDay.find(1)
                    render json: { status: 'Success', data: assignment_chore_days }
                elsif wh == '2' && pj == '1'
                    assignment_chore_days = AssignmentChoreDay.find(2)
                    render json: { status: 'Success', data: assignment_chore_days }
                elsif wh == '3' && pj == '1'
                    assignment_chore_days = AssignmentChoreDay.find(3)
                    render json: { status: 'Success', data: assignment_chore_days }
                elsif wh == '1' && pj == '2' || pj == '3'
                    assignment_chore_days = AssignmentChoreDay.find(4)
                    render json: { status: 'Success', data: assignment_chore_days }
                elsif wh == '2' && pj == '2' || pj == '3'
                    assignment_chore_days = AssignmentChoreDay.find(5)
                    render json: { status: 'Success', data: assignment_chore_days }
                elsif wh == '3' && pj == '2' || pj == '3'
                    assignment_chore_days = AssignmentChoreDay.find(6)
                    render json: { status: 'Success', data: assignment_chore_days }
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


