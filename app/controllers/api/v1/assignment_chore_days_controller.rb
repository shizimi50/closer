module Api
    module V1
        class AssignmentChoreDaysController < ApplicationController
            before_action :assignment_chore_days_params, only:[:create, :update, :destroy]
            before_action :set_assignment_chore_days, only:[:update, :destroy]

            def index
                assignment_chore_days = AssignmentChoreDay.all
                render json: { status: 'Success', data: assignment_chore_days }
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


