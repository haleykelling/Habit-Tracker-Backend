class AuthenticationController < ApplicationController

    def login
        @user = User.find_by(email: params[:user][:email])
        user_info = {name: @user.first_name, email: @user.email}
        
        if !@user || !@user.authenticate(params[:user][:password])
            render json: {errors: ["Wrong username or password."]}, status: :unauthorized
        else
            secret = Rails.application.secret_key_base
            payload = {user_id: @user.id}
            @token = JWT.encode payload, secret 
            render json: {user: user_info, token: @token} 
        end

    end

end
