module Api
    module V1
        class SurveysController < ApplicationController
            before_action :logged_in_user
            before_action :survey_params, only:[:create, :update, :destroy]

            def index
                survey = Survey.all
                render json: { data: survey }
            end					

            def create
                survey = current_user.surveys.build(survey_params)

                if survey.save
                    render json: { data: survey }
                else
                    render json: { message: survey.errors.full_messages }
                end
            end

            def update
                survey = Survey.where(user_id: current_user.id).last
                if survey.update(survey_params)
                    date = survey.assignment_date

                    if ["月","火","水","木","金"].any?{|i| date.include?(i)} && ["土","日"].any?{|i| date.include?(i)} #全日の条件
                        survey.update(week_category: 1) #全日
                    elsif ["月","火","水","木","金"].any?{|i| date.include?(i)} && ["土"].any?{|i| date.exclude?(i)} && ["日"].any?{|i| date.exclude?(i)} #平日のみが含まれる条件
                        survey.update(week_category: 2) #平日
                    else
                        survey.update(week_category: 3) #休日
                    end
                    render json: { data: survey }
                else
                    render json: { message: survey.errors.full_messages }
                end
            end

            private
            
            def survey_params
                params.permit(:sex, :birth, :working_hours, :holiday, :jobsituation_id, :children, :youngest_child_age, :has_child_kindergarten, :assignment_date, :week_category, :user_id)
            end
        end
    end
end

