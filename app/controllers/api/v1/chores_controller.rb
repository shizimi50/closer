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
            
            # 全ての登録家事取得
            def index
                chores = Chore.all
                render json: { status: 'Success', data: chores }
            end

            # 登録todo(家事)一覧
            def my_todos
                chores = Chore.where(user_id: @current_user.id)
                render json: { status: 'Success', data: chores }
            end

            # おすすめ家事一覧
            def recommend_todos                
                survey = Survey.find_by(user_id: @current_user.id)
                children = survey.children
                youngest = survey.youngest_child_age.delete("^0-9").to_i
                kd = survey.kindergarten

                if children.exclude?("いない") && youngest <= 6 && kd.include?("有")
                    chores = Chore.where(user_id: 0).as_json(only: :chore_name)
                    render json: { status: 'Success', data: chores}
                elsif children.exclude?("いない") && youngest <= 8 && kd.include?("有")
                    chores = Chore.find(1,2,3,4,5,6).as_json(only: :chore_name)
                    render json: { status: 'Success', data: chores}
                elsif children.include?("いない") 
                    chores = Chore.find(1,2,3,4,5).as_json(only: :chore_name)
                    render json: { status: 'Success', data: chores}
                else
                    render json: { status: 'Error',  message: chores.errors.full_messages }
                end
            end

            def today
              today = Date.today.strftime("%Y-%m-%d")
              chores = Chore.where(start_time: today, user_id: @current_user.id)
              # choresChore.where("(start_time = ?) OR (user_id = ?)", today,  @current_user.id)
              render json: { status: 'Success', data: chores }
            end

            def week
              chores = Chore.where(user_id: @current_user.id)
              this_week = Date.today.all_week # all_weekをDate.todayに適用すると、今週の年月日データを取得できる。
              chores.map do |chore| 
                    if (this_week.include?(chore[:start_time]))
                    end
                end
            render json: { status: 'Success', data: chores }
            end


            def show
                render json: { status: 'Success', data: { chore_way: @chore.chore_ways, chore_tools: @chore.chore_tools } }
            end

            def recommend_results
                selected_list = JSON.parse(request.body.read) #フロントから受け取ったパラメータをjson化 
                wday_list = selected_list[0]
                chore_list = selected_list[1].values

                 today = Date.today #今日の日付
                 array_list = Array.new(55){|i|today + i} #今日から48日分の日付を取得

                 start_time = array_list.map{|array|
                    wday_list.map { |key, value|
                        if array.wday === value
                            puts array
                            start_time = array
                         end
                    }.compact
                }.flatten

                i = 0
                chore_list.each{|chore|
                    i += 1
                    Chore.create(chore_name: chore, start_time: start_time[i-1], user_id: @current_user.id)
                }
                render json: { status: 'Success',  data: chore_list}

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
                @chore = Chore.find_by(params[:id])
            end

        end
    end
end

