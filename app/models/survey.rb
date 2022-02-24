class Survey < ApplicationRecord
    # =====Validation======
    validates :sex, :birth, :working_hours, :holiday, :jobsituation_id, :children, presence: true #空の値に対してバリデーション設定
    # ＝＝＝＝＝＝＝＝＝＝＝＝＝

    # ＝＝＝＝関連付け＝＝＝＝＝
    belongs_to :user
    belongs_to :jobsituation
    # ＝＝＝＝＝＝＝＝＝＝＝＝＝

    # ＝＝デフォルト値設定＝＝＝
    attribute :has_child_kindergarten, :boolean, default: false
    # ＝＝＝＝＝＝＝＝＝＝＝＝＝

end
