module Api
    module V1
        class ChoresController < ApplicationController
            require 'json'
            require 'date'
            require 'active_record'
            require 'activerecord-import'
            before_action :logged_in_user
            before_action :chore_params, only:[:create, :update, :destroy]
            before_action :set_chore, only:[:show, :update, :destroy]

            def index
                chores = Chore.where(user_id: @current_user.id)
                render json: { status: 'Success', data: chores }
            end
            

            def show
                render json: { status: 'Success', data: { chore_way: @chore.chore_ways, chore_tools: @chore.chore_tools } }
            end

            def recommend_chores
                selected_list = JSON.parse(request.body.read) #フロントから受け取ったパラメータをjson化
                 today = Date.today #今日の日付
                 array_list = Array.new(55){|i|today + i} #今日から48日分の日付を取得

                 start_time = array_list.map{|array|
                    selected_list.map { |key, value|
                        if array.wday === value
                            puts array
                            start_time = array
                         end
                    }.compact
                }.flatten

                # TODO家事データの元
                columns = [ :chore_name, :start_time, :user_id]
                values = [ ['洗濯', start_time[0], @current_user.id], ['ゴミ捨て', start_time[1], @current_user.id], ['風呂掃除' , start_time[2], @current_user.id], ['トイレ掃除' , start_time[3], @current_user.id], ['食後の片付け' , start_time[4], @current_user.id], ['子の入浴補助' , start_time[5], @current_user.id], ['子の食事補助' , start_time[6], @current_user.id], ['子の登園準備' , start_time[7], @current_user.id] ]

                survey = Survey.find_by(user_id: @current_user.id)
                children = survey.children
                youngest = survey.youngest_child_age.delete("^0-9").to_i
                kd = survey.kindergarten

                if children.exclude?("いない") && youngest <= 6 && kd.include?("有")
                    Chore.import columns, values, validate: true
                    chore = Chore.where(user_id: @current_user.id)
                    render json: { status: 'Success', data: chore}
                elsif children.exclude?("いない") && youngest <= 8 && kd.include?("有")
                    Chore.import columns, values[0..6], validate: true
                    chore = Chore.where(user_id: @current_user.id)
                    render json: { status: 'Success', data: chore}
                elsif children.include?("いない") 
                    Chore.import columns, values[0..4], validate: true
                    chore = Chore.where(user_id: @current_user.id)
                    render json: { status: 'Success', data: chore}
                else
                    render json: { status: 'Error',  message: chore.errors.full_messages }
                end
            end

            def create
              today = Date.today
              chores = Chore.new(chore_name: params[:chore_name], user_id: @current_user.id, start_time: today)
              if chores.save
                  render json: { status: 'Success',  data: chores }
              else
                  render json: { status: 'Error',  message: chores.errors.full_messages }
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

