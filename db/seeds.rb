# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "csv"
require "date"

#  ----------------------------------------------------------------------------------------------------------------------------
#  おすすめ家事日時
#  ----------------------------------------------------------------------------------------------------------------------------
AssignmentChoreDay.create(working_hours: '1~1.5hr', chore_days: '平日')
AssignmentChoreDay.create(working_hours: '30mins~1hr', chore_days: '平日')
AssignmentChoreDay.create(working_hours: '15mins~30mins', chore_days: '休日')
AssignmentChoreDay.create(working_hours: '1~1.5hr', chore_days: '休日')
AssignmentChoreDay.create(working_hours: '30mins~1hr', chore_days: '休日')
AssignmentChoreDay.create(working_hours: '15mins~30mins', chore_days: '休日')

#  ----------------------------------------------------------------------------------------------------------------------------
#  家事データ作成
#  ----------------------------------------------------------------------------------------------------------------------------

Chore.create(chore_name: '洗濯', user_id: 0 )
Chore.create(chore_name: 'ゴミ捨て', user_id: 0)
Chore.create(chore_name: '風呂掃除', user_id: 0)
Chore.create(chore_name: 'トイレ掃除', user_id: 0)
Chore.create(chore_name: '食後の片付け', user_id: 0)
Chore.create(chore_name: '子の入浴補助', user_id: 0)
Chore.create(chore_name: '子の食事補助', user_id: 0)
Chore.create(chore_name: '子の登園準備', user_id: 0)

#  ----------------------------------------------------------------------------------------------------------------------------
#  家事方法作成
#  ----------------------------------------------------------------------------------------------------------------------------

# CSV.foreach('db/chore_ways.csv') do |row|
#     ChoreWay.create(:step_name => row[0], :method => row[1], :chore_id => row[2], :deleted_at => row[3])
# end

#  ----------------------------------------------------------------------------------------------------------------------------
#  家事道具作成
#  ----------------------------------------------------------------------------------------------------------------------------

# ChoreTool.create(tool_name: '洗濯あみ、洗剤、柔軟剤、漂白剤、ブラシ、固形石鹸、ハンガー、洗濯バサミ、洗濯かご', chore_id: 1)
# ChoreTool.create(tool_name: 'ゴミ袋（地域によってゴミの種類によって使うゴミ袋が異なる可能性があるので注意）', chore_id: 2)
# ChoreTool.create(tool_name: '洗剤、ブラシ、スポンジ、雑巾、タオル、手袋、バスシューズ、詰め替え', chore_id: 3)
# ChoreTool.create(tool_name: 'トイレクリーナー、トイレブラシ、洗剤、トイレスタンプ、手拭きタオル、マット', chore_id: 4)
# ChoreTool.create(tool_name: '食器用洗剤,スポンジ,除菌シート,台ふきん,タッパー,ラップ,食器用布巾', chore_id: 5)
# ChoreTool.create(tool_name: '入浴用おもちゃ、おむつ,下着,タオル,バスマット,着替え,パジャマ,保湿クリーム,ドライヤー,ブラシ', chore_id: 6)
# ChoreTool.create(tool_name: '食事用チェア、コップ、お皿、カトラリー、お手拭き、前掛け、台ふきん、洗剤、スポンジ、除菌シート、除菌剤', chore_id: 7)
# ChoreTool.create(tool_name: '着替え、下着、おむつ、コップ、お皿、タオル、ハンカチ、ティッシュ、連絡帳', chore_id: 8)


#  ----------------------------------------------------------------------------------------------------------------------------
#  開始時間設定（家事データ更新）
#  ----------------------------------------------------------------------------------------------------------------------------

# start_day = Date.new(2020, 6, 15)
# last_day = Date.new(2020, 9, 15)

# irb(main):003:0> Random.rand(start_day..last_day)
# => Sat, 05 Sep 2020
# irb(main):004:0> Random.rand(start_day..last_day)
# => Fri, 03 Jul 2020
# irb(main):005:0> Random.rand(start_day..last_day)


