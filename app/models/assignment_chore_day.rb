class AssignmentChoreDay < ApplicationRecord

        # =====Validation======
        validates :working_hours,:chore_days, presence: true
        # ＝＝＝＝＝＝＝＝＝＝＝＝＝

        # ＝＝＝＝関連付け＝＝＝＝＝ 
        #https://qiita.com/aiorange19/items/2120d91912bc643273da
        belongs_to :survey
        # ＝＝＝＝＝＝＝＝＝＝＝＝＝
    
end
