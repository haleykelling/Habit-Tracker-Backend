class UsersController < ApplicationController
    skip_before_action :authenticate, only: [:create]

    def profile
        @user = current_user
        user_info = {name: @user.first_name, email: @user.email}

        render json: {user: user_info, habits: @user.habits}
    end
    
    def create
        @user = User.new user_params
        user_info = {name: @user.first_name, email: @user.email}

        if @user.save
            secret = Rails.application.secret_key_base
            payload = {user_id: @user.id}
            @token = JWT.encode payload, secret 
            render json: {token: @token, user: user_info, habits: @user.habits}
        else
            render json: {errors: @user.errors.full_messages}, status: :not_acceptable
        end
    end

    private

    def user_params
        params.require(:user).permit(
            :first_name,
            :last_name,
            :email,
            :password
        )
    end


end
