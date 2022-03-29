source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'rails', '6.1.3.1'
# Use sqlite3 as the database for Active Record
gem 'mysql2'
# Use Puma as the app server
gem 'puma', '~> 5.0'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
gem 'redis-rails'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

gem "activestorage"

gem 'firebase-auth-rails' # 追記
gem 'firebase_id_token', '~> 2.4.0' # 追記
gem 'google-apis-identitytoolkit_v3' #追記
gem 'googleauth' #追記
gem "google-cloud-storage", "~> 1.34" #追記
gem 'jwt' #追記
gem 'hirb'        #追記 # 出力結果を表として出力するgem
gem 'hirb-unicode' #追記 # マルチバイト文字の表示を補正するgem
# 論理削除
gem 'paranoia' #追記
gem 'activerecord-import' #追記
gem 'active_model_serializers' #追記
gem "rails_same_site_cookie", "~> 0.1.8" #追加

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.4', require: false

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors'

gem 'dotenv-rails'

# webpackerを追記
gem "webpacker"

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'listen', '~> 3.3'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

