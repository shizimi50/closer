# Be sure to restart your server when you modify this file.

# Avoid CORS issues when API is called from the frontend app.
# Handle Cross-Origin Resource Sharing (CORS) in order to accept cross-origin AJAX requests.

# Read more: https://github.com/cyu/rack-cors

Rails.application.config.middleware.insert_before 0, Rack::Cors do
    allow do
        origins 'localhost:5001', 'localhost:8080/', 'https://ik1-341-30511.vs.sakura.ne.jp'

        resource '*',
        headers: :any,
        methods: [:get, :post, :put, :patch, :delete, :options, :head],
        credentials: true 
    end

    #本番環境用のオリジン設定
    # allow do
    #     origins 'https:<自身が設定するアプリのURL>'

    #     resource '*',
    #         headers: :any,
    #         methods: [:get, :post, :put, :patch, :delete, :options, :head],
    #         credentials: true
    # end
end
