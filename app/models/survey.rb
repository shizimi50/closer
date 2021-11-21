class Survey < ApplicationRecord
    # =====Validation======
    validates :sex, :birth, :working_hours, :holiday, :partner_jobsituation, :children, :youngest_child_age, :kindergarten, :user_id, presence: true #空の値に対してバリデーション設定
    # ＝＝＝＝＝＝＝＝＝＝＝＝＝

    # ＝＝＝＝関連付け＝＝＝＝＝
    belongs_to :user, optional: true #nullの許容
    # ＝＝＝＝＝＝＝＝＝＝＝＝＝


end
