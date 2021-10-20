class Api::V1::ApplicationController < ActionController::API
    # 下記２行により、ApplicationControllerを継承したコントローラのメソッドにアクセス時、
    # HTTPリクエストヘッダに、「Authorization: “Bearer *****************(トークン)”」を入れるだけで、勝手にJWT認証してくれる
    # include Firebase::Auth::Authenticable    
    # protect_from_forgery with: :exception

    include ActionController::HttpAuthentication::Token::ControllerMethods
    include SessionsHelper    
  
    private                                                        
      # tokenが正規のものであれば、デコード結果を返す
      # そうでなければfalseを返す
      def authenticate_firebase_id_token
        # authenticate_with_http_tokenは、HTTPリクエストヘッダーに
        # Authorizationが含まれていればブロックを評価する。
        # 含まれていなければnilを返す。
        authenticate_with_http_token do |token, options|
          begin
            # 受け取った認証情報を検証しデコード
            decoded_token = FirebaseHelper::Auth.verify_id_token(token)
          rescue => e
            logger.error(e.message)
            false
          end
        end
      end
    
end