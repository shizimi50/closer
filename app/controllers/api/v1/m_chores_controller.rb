module Api
    module V1
        class MChoresController < ApplicationController
            before_action :logged_in_user

            #  マイページからの家事作成時表示
            def index
                m_chores = MChore.all
                render json: { data: m_chores}
            end

            # おすすめ家事一覧
            def recommend_todos              
                survey = Survey.where(user_id: @current_user.id).last
                children = survey.children # 子供の有無
                youngest = survey.youngest_child_age # 一番下の子供の年齢
                kd = survey.has_child_kindergarten # 通園の有無
                date = survey.week_category # 担当したい家事曜日の区分

                chores_1 = [1,2,3,4,5]
                chores_2 = [1,2,3,4,5,9]
                chores_3 = [1,2,3,4,5,6]
                chores_4 = [1,2,3,4,5,6,7,8]
                chores_5 = [1,2,3,4,5,6,7,8,9]

                if  date == 1 #全日
                    if children == 0 # 子供いない場合
                        chores = MChore.find(chores_1)
                    elsif (youngest >= 7) #7歳以上の場合
                        if kd #通園有
                            chores = MChore.find(chores_4)
                        else
                            chores = MChore.find(chores_3)
                        end
                    else #6歳以下の場合
                        if kd #通園有
                            chores = MChore.find(chores_5)
                        else
                            chores = MChore.find(chores_4)
                        end
                    end
                    render json: {data: chores}
                elsif  date == 2 #平日
                    if children == 0 # 子供いない場合
                        chores = MChore.find(chores_1)
                    elsif (youngest >= 7) #7歳以上の場合
                        if kd #通園有
                            chores = MChore.find(chores_4)
                        else
                            chores = MChore.find(chores_3)
                        end
                    else #6歳以下の場合
                        if kd #通園有
                            chores = MChore.find(chores_2)
                        else
                            chores = MChore.find(chores_1)
                        end
                    end
                    render json: {data: chores}
                elsif date == 3 #休日
                    if children == 0 # 子供いない場合
                        chores = MChore.find(chores_1)
                    elsif (youngest >= 7) #7歳以上の場合
                        if kd #通園有
                            chores = MChore.find(chores_4)
                        else
                            chores = MChore.find(chores_3)
                        end
                    else #6歳以下の場合
                        if kd #通園有
                            chores = MChore.find(chores_5)
                        else
                            chores = MChore.find(chores_4)
                        end
                    end
                    render json: {data: chores}
                else
                    render json: {data: chores.errors.full_messages}
                end
            end


        end
    end
end
