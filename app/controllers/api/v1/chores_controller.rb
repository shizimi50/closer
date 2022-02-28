module Api
    module V1
        class ChoresController < ApplicationController
            require 'json'
            require 'date'
            require 'active_record'
            require 'activerecord-import'
            before_action :logged_in_user
            before_action :chore_params, only:[:create, :update, :destroy,:remove_todo, :skip_todo]
            before_action :set_chore, only:[:show, :update, :destroy, :remove_todo, :skip_todo]
            
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


            def today
              days = ["日", "月", "火", "水", "木", "金", "土"]
              today = Date.today.strftime("%Y-%m-%d")
              chores = Chore.where('start_time = ? or assignment_date = ?', today, days[Date.today.wday]).where(user_id: @current_user.id) #今日 または 今日の曜日
              render json: { status: 'Success', data: chores }
            end

            def week
                # skip_date = 今週でない

                this_week = Date.today.all_week
                chores_1 = Chore.where.not(assignment_date: nil).where(user_id: @current_user.id, skip_date: nil) #skip_data以外
                chores_2 = Chore.where.not(skip_date: nil).where(user_id: @current_user.id) #skip_dataのみ

                chores_2.map {|chore|
                    if !(chore == Date.today - (Date.today.wday - 1) && Date.today - (Date.today.wday - 2) && Date.today - (Date.today.wday - 3) && Date.today - (Date.today.wday - 4) && Date.today - (Date.today.wday - 5) && Date.today - (Date.today.wday - 6) && Date.today - (Date.today.wday - 7)) 
                        chores_2 = chore
                    end
                }

                # start_time = 今週
                chores_c = Chore.where.not(start_time: nil).where(user_id: @current_user.id)
                  chores_3 = this_week.map{|date|
                      chores_c.map { |chore|
                          if date == chore.start_time
                            chores_3 = chore
                          end
                      }.compact
                  }.flatten

                render json: { status: 'Success', data1: chores_1, data2: chores_2, data3: chores_3}
  
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
                    Chore.create(chore_name: chore, assignment_date: wday_list[k-1], user_id: @current_user.id)
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

            def remove_todo
                today = Date.today #今日
                if !@chore.start_time.nil?
                    @chore.start_time = nil
                    @chore.save
                    render json: { status: 'Success', data: @chore }
                elsif !@chore.assignment_date.nil? && @chore.skip_date != today #曜日あり 且つ skip_dateが今日でない
                    @chore.update(skip_date: today)
                    @chore.save
                    render json: { status: 'Success', data: @chore }
                else
                    render json: { status: 'Error', data: @chore.full_messages }
                end
            end

            def skip_todo
                today = Date.today #今日
                days = {"日" => 0, "月" => 1, "火" => 2, "水" => 3, "木" => 4, "金" => 5, "土" => 6}
                skip_date = ""
                days.map{|key, value|
                    if key == @chore.assignment_date
                        skip_date = today - (today.wday - value)
                    end
                }
                if !@chore.start_time.nil?
                    @chore.start_time = nil
                    @chore.save
                    render json: { status: 'Success', data: @chore }
                elsif !@chore.assignment_date.nil? && @chore.skip_date != skip_date
                    @chore.update(skip_date: skip_date)
                    @chore.save
                    render json: { status: 'Success', data: @chore }
                else
                    render json: { status: 'Error', data: @chore.full_messages }
                end
            end

            private
            
            def chore_params
                params.permit(:chore_name, :start_time, :user_id, :skip_date)
            end

            def set_chore
                @chore = Chore.find(params[:id])
            end

        end
    end
end

