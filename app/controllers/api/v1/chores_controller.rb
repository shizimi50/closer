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
                chores = Chore.where(user_id: @current_user.id).with_deleted
                render json: { status: 'Success', data: chores }
            end

            # おすすめ家事一覧
            def recommend_todos              
                survey = Survey.where(user_id: @current_user.id).last
                children = survey.children # 子供の有無
                youngest = survey.youngest_child_age.delete("^0-9").to_i
                kd = survey.kindergarten # 通園の有無
                date = survey.week_category # 担当したい家事曜日の区分

                chores_1 = Chore.find(1,2,3,4,5).as_json(only: :chore_name)
                chores_2 = Chore.find(1,2,3,4,5,9).as_json(only: :chore_name)
                chores_3 = Chore.find(1,2,3,4,5,6).as_json(only: :chore_name)
                chores_4 = Chore.find(1,2,3,4,5,6,7,8).as_json(only: :chore_name)
                chores_5 = Chore.find(1,2,3,4,5,6,7,8,9).as_json(only: :chore_name)

                if  date == 1 #全日
                    if children.include?("いない") # 子供いない場合
                        render json: { status: 'Success', data: chores_1}
                    elsif (youngest >= 7) #7歳以上の場合
                        if kd.include?("有")
                            render json: { status: 'Success', data: chores_4}
                        else
                            render json: { status: 'Success', data: chores_3}
                        end
                    else #6歳以下の場合
                        if kd.include?("有")
                            render json: { status: 'Success', data: chores_5}
                        else
                            render json: { status: 'Success', data: chores_4}
                        end
                    end
                elsif  date == 2 #平日
                    if children.include?("いない") # 子供いない場合
                        render json: { status: 'Success', data: chores_1}
                    elsif (youngest >= 7) #7歳以上の場合
                        if kd.include?("有")
                            render json: { status: 'Success', data: chores_4}
                        else
                            render json: { status: 'Success', data: chores_3}
                        end
                    else #6歳以下の場合
                        if kd.include?("有")
                            render json: { status: 'Success', data: chores_2}
                        else
                            render json: { status: 'Success', data: chores_1}
                        end
                    end
                elsif date == 3 #休日
                    if children.include?("いない") # 子供いない場合
                        render json: { status: 'Success', data: chores_1}
                    elsif (youngest >= 7) #7歳以上の場合
                        if kd.include?("有")
                            render json: { status: 'Success', data: chores_4}
                        else
                            render json: { status: 'Success', data: chores_3}
                        end
                    else #6歳以下の場合
                        if kd.include?("有")
                            render json: { status: 'Success', data: chores_5}
                        else
                            render json: { status: 'Success', data: chores_4}
                        end
                    end
                else
                    render json: { status: 'Error', data: chores.errors.full_messages}
                end
            end


            def today
              days = ["日", "月", "火", "水", "木", "金", "土"]
              today = Date.today.strftime("%Y-%m-%d")

              chores_1 = Chore.where(start_time: today, user_id: @current_user.id) #今日のみ
              chores_2 = Chore.where(assignment_date: days[Date.today.wday], user_id: @current_user.id) #今日の曜日

              render json: { status: 'Success', data1: chores_1, data2: chores_2 }
            end

            def week
              chores = Chore.where(user_id: @current_user.id)
              chores_1 = {}
              chores = chores.each do |chore| 
                  if !chore[:start_time].nil?
                      chores_1 = chore
                  end
              end
              chores_2 = Chore.where.not(assignment_date: nil).where(user_id: 1)

              render json: { status: 'Success', data1: chores_1, data2: chores_2 }

            end

            def show
                render json: { status: 'Success', data: { chore_way: @chore.chore_ways, chore_tools: @chore.chore_tools } }
            end

            def recommend_results
                selected_list = JSON.parse(request.body.read) #フロントから受け取ったパラメータをjson化
                survey = Survey.where(user_id: @current_user.id).last
                wday_list = survey.assignment_date.split(",")
                chore_list = selected_list[0].values

                i = 0
                j = 0
                while i<8
                    wday_list << wday_list[j]
                 i += 1
                 j += 1
                end

                k = 0
                chore_list = chore_list.map{|chore|
                    k += 1
                    Chore.create(chore_name: chore, assignment_date: wday_list[k-1], user_id: 1)
                }
                render json: { status: 'Success',  data: chore_list}

            end

            def create
              today = Date.today
              chores = Chore.new(chore_name: chore_params[:chore_name], start_time: chore_params[:start_time], user_id: @current_user.id)
                if chores.start_time.nil?
                    chores.update(start_time: today)
                    render json: { status: 'Success',  data: chores }
                elsif chores.save                    
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
                params.permit(:chore_name, :start_time, :user_id)
            end

            def set_chore
                @chore = Chore.find(params[:id])
            end

        end
    end
end

