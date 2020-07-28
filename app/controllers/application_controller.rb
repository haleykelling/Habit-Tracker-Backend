class ApplicationController < ActionController::API

    def authenticate
        header = request.headers["Authorization"]
        token = header.split(" ").last

        if !token 
            render json: {errors: ["Must be logged in."]}, status: :forbidden
        else
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
