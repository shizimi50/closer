class Api::V1::ApplicationController < ActionController::API

    include ActionController::HttpAuthentication::Token::ControllerMethods #HTTP Token 認証を非常に簡単に実行できるモジュール
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