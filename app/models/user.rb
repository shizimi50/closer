class User < ApplicationRecord
    # # =====Validation======
    validates :email, presence: true
    # # ＝＝＝＝＝＝＝＝＝＝＝＝＝

    # # ＝＝＝＝関連付け＝＝＝＝＝
    has_many :chores
    has_many :surveys
    has_many :assignment_chore_days
    # has_many :chore_ways, through: :chores #userモデルからchore_waysへ直接関連付けを定義
    # # ＝＝＝＝＝＝＝＝＝＝＝＝＝

end