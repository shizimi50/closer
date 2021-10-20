class ChoreWay < ApplicationRecord
    # =====Validation======
    validates :chore_id, presence: true
    # ＝＝＝＝＝＝＝＝＝＝＝＝＝

    # ＝＝＝＝関連付け＝＝＝＝＝
    belongs_to :chore #choreとの関連付け
    has_many :chore_tools
    # ＝＝＝＝＝＝＝＝＝＝＝＝＝

    # ＝＝フレームワーク関連＝＝
    acts_as_paranoid #論理削除適用
    # ＝＝＝＝＝＝＝＝＝＝＝＝＝
end
