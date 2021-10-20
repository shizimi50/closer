module Api
    module V1
        class ChoreWaysController < ApplicationController        
            before_action :chore_way_params, only:[:create, :update, :destroy]
            before_action :set_chore_way, only:[:update, :destroy]
            before_action :get_chore, only:[:index]
        
            def index
                chore_ways = @chore.chore_ways
                render json: { status: 'Success', data: chore_ways }
            end

            def recommend_task
                chore_ways = Chore.joins(:chore_ways).select('chore_ways.id, chores.chore_name, chore_ways.step_name')
                render json: { status: 'Success', data: { recommend_task: chore_ways } }
            end
        
            def create
                chore_way = ChoreWay.new(chore_way_params)
                if chore_way.save
                    render json: { status: 'Success',  data: chore_way }
                else
                    render json: { status: 'Error',  message: chore_way.errors.full_messages }
                end
            end
        
            def update
                if @chore_way.update(chore_way_params)
                    render json: { status: 'Success', data: @chore_way }
                else
                    render json: @chore_way.errors
                end
            end
        
            def destroy
                if @chore_way.destroy
                    render json: { status: 'Success', data: @chore_way }
                else
                    render json: @chore_way.errors
                end
            end
        
            private
            
            def chore_way_params
                params.permit(:step_name, :chore_id, :method)
            end
        
            def set_chore_way
                @chore_way = ChoreWay.find(params[:id])
            end

            def get_chore
                @chore = Chore.find(params[:chore_id])
            end

        
        end

    end
end

