class ApplicationController < ActionController::API
    before_action :authenticate

    def authenticate
        render json: {errors: ["Must be logged in."]}, status: :unauthorized unless logged_in?
    end
    
    def logged_in?
        !!current_user
    end

    def current_user
        header = request.headers["Authorization"]
        
        if header
            token = header.split(" ").last
            secret = Rails.application.secret_key_base
            begin
                payload = JWT.decode(token, secret)[0] 
                @user = User.find(payload[“user_id”])
            rescue
                render json: {errors: ["Must be logged in."]}, status: :forbidden
            end
        end
    end

end
