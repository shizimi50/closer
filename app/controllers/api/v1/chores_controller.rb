module Api
    module V1
        class ChoresController < ApplicationController
            before_action :chore_params, only:[:create, :update, :destroy]
            before_action :set_chore, only:[:show, :update, :destroy]

            def index
                chores = Chore.all
                render json: { status: 'Success', data: chores }
            end

            def show
                render json: { status: 'Success', data: { chore_way: @chore.chore_ways, chore_tools: @chore.chore_tools } }
            end


            def create
                chore = Chore.new(chore_params)
                if chore.save
                    render json: { status: 'Success',  data: chore }
                else
                    render json: { status: 'Error',  message: chore.errors.full_messages }
                end
            end

            def update
                if @chore.update(chore_params)
                    render json: { status: 'Success', data: @chore }
                else
                    render json: @chore.errors
                end
            end

            def destroy
                if @chore.destroy
                    render json: { status: 'Success', data: @chore }
                else
                    render json: @chore.errors
                end
            end

            private
            
            def chore_params
                params.permit(:chore_name, :user_id, :start_time)
            end

            def set_chore
                @chore = Chore.find(params[:id])
            end

        end
    end
end

