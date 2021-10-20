class User < ApplicationRecord
    # # =====Validation======
    # validates :email, presence: true
    # # ＝＝＝＝＝＝＝＝＝＝＝＝＝

    # # ＝＝＝＝関連付け＝＝＝＝＝
    # has_many :chores, dependent: :destroy #choresとの関連づけ
    # has_many :chore_ways, through: :chores #userモデルからchore_waysへ直接関連付けを定義
    # # ＝＝＝＝＝＝＝＝＝＝＝＝＝

    # # ＝＝フレームワーク関連＝＝
    # acts_as_paranoid #論理削除適用
    # # ＝＝＝＝＝＝＝＝＝＝＝＝＝
end
