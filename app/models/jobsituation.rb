class Jobsituation < ApplicationRecord
        # =====Validation======
        validates :jobsituation_name, presence: true
        # ＝＝＝＝＝＝＝＝＝＝＝＝＝
    
        # ＝＝＝＝関連付け＝＝＝＝＝
        has_many :survey
        # ＝＝＝＝＝＝＝＝＝＝＝＝＝
end
