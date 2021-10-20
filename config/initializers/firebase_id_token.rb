FirebaseIdToken.configure do |config|
    config.redis = Redis.new
    config.project_ids = ['closer-b4bc4']
end