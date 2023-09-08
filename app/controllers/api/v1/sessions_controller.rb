module Api
  module V1
    class SessionsController < ApplicationController
      def create
        @user = User.find_by_email(params[:email])

        if @user&.authenticate(params[:password])
          token = JsonWebToken.encode(user_id: @user.id)
          time = Time.current + 24.hours.to_i
          render json: {
            user: UserSerializer.render(@user),
            token: token, exp: time.strftime("%m-%d-%Y %H:%M")
          }
        else
          render json: {message: "Invalid Email/Password"}, status: :unauthorized
        end
      end
    end
  end
end