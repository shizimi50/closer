module Api
    module V1
        class UsersController < ApplicationController

            before_action :logged_in_user

            def index
              @users = User.all
            end
            
        end
    end
end