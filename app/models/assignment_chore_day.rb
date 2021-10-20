class AssignmentChoreDay < ApplicationRecord

        # =====Validation======
        validates :working_hours,:chore_days, presence: true
        # ＝＝＝＝＝＝＝＝＝＝＝＝＝
    
end
