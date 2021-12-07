class Chore < ApplicationRecord
    # =====Validation======
    validates :chore_name, presence: true #空の値に対してバリデーション設定
    # ＝＝＝＝＝＝＝＝＝＝＝＝＝

    # ＝＝＝＝関連付け＝＝＝＝＝
    belongs_to :user, dependent: :destroy, optional: true #nullの許容
    has_many :chore_ways, dependent: :destroy #chore_waysとの関連づけ
    has_many :chore_tools, dependent: :destroy #chore_toolsとの関連づけ
    # belongs_to :survey
    # ＝＝＝＝＝＝＝＝＝＝＝＝＝

    # ＝＝フレームワーク関連＝＝
    acts_as_paranoid #論理削除適用
    # ＝＝＝＝＝＝＝＝＝＝＝＝＝

end
