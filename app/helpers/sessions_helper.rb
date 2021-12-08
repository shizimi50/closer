module SessionsHelper
    def log_in(user)
      session[:uid] = user.uid
    end
  
    # 現在のユーザーをログアウトする
    def destroy
      session.delete(:uid)
      @current_user = nil
    end 
  
    # ユーザーがログインしていればtrue, その他ならfalseを返す
    def logged_in?
      !current_user.nil?
    end
  
    # # アクセスしようとしたURLを覚えておく
    # def store_location
    #   # request.getのときだけ記憶するようにしているのは、次のようなパターンでエラーになるため。
    #   # 例えばログイン後投稿ボタン押す直前でブラウザのセッション削除→投稿すると、ログインページに
    #   # 飛ぶけど、このときsession[:forwarding_url]にPOSTしか受け付けない想定をしたURLが保存され、
    #   # ログイン後にそのURLをGETしに行くとno route matchesエラーになる。
    #   session[:forwarding_url] = request.original_url if request.get?
    # end
  
    # 記憶トークンcookieに対応するユーザーを返す（参考：https://qiita.com/d0ne1s/items/7c4d2be3f53e34a9dec7）
    def current_user
      # セッション(ブラウザが閉じると消えるもの)のuidを代入
      if (uid = session[:uid]) #「(ユーザーuidにユーザーuidのセッションを代入した結果) ユーザーuidのセッションが存在すれば」
        # @current_userがnilならば、Userテーブルからuidで検索し、userオブジェクトを代入する。
        # @current_userがnilでないのなら、そのまま
        @current_user ||= User.find_by(uid: uid)
      end
    end
  
    # 記憶したURL（もしくはデフォルト値）にリダイレクト
    # def redirect_back_or(default)
    #   redirect_to(session[:forwarding_url] || default)
    #   session.delete(:forwarding_url)
    # end
  
    private
      # ログイン済みユーザーかどうか確認
      def logged_in_user
        unless logged_in?
          # store_location
          render json: { message: 'ログインして下さい。' }
        end
      end
  end