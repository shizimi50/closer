module Api
    module V1
        class ChoreToolsController < ApplicationController
            before_action :chore_tool_params, only:[:create, :update, :destroy]
            before_action :set_chore_tool, only:[:update, :destroy]
            before_action :get_chore, only:[:index]
        
            def index
                chore_tools = @chore.chore_tools
                render json: { status: 'Success', data: chore_tools }
            end
        
            def create
                chore_tool = ChoreTool.new(chore_tool_params)
                if chore_tool.save
                    render json: { status: 'Success',  data: chore_tool }
                else
                    render json: { status: 'Error',  message: chore_tool.errors.full_messages }
                end
            end
        
            def update
                if @chore_tool.update(chore_tool_params)
                    render json: { status: 'Success', data: @chore_tool }
                else
                    render json: @chore_tool.errors
                end
            end
        
            def destroy
                if @chore_tool.destroy
                    render json: { status: 'Success', data: @chore_tool }
                else
                    render json: @chore_tool.errors
                end
            end
        
            private
            
            def chore_tool_params
                params.permit(:tool_name, :chore_id, :take_time)
            end
        
            def set_chore_tool
                @chore_tool = ChoreTool.find(params[:id])
            end

            def get_chore
                @chore = Chore.find(params[:chore_id])
            end


        end
    end
end



