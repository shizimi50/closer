module Api
    module V1
        class SurveysController < ApplicationController

            def index
                survey = Survey.all
                render json: { status: 'Success', data: survey }
            end

            def create
                survey = Survey.new(survey_params)
                if survey.save
                    render json: { status: 'Success',  data: survey }
                else
                    render json: { status: 'Error',  message: survey.errors.full_messages }
                end
            end

            private
            
            def survey_params
                params.permit(:sex, :birth, :working_hours, :holiday, :partner_jobsituation, :children, :youngest_child_age, :kindergarten, :user_id)
            end

            def set_survey
                @survey = Survey.find(params[:id])
            end


        end
    end
end

