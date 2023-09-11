module Api
  module V1
    class SessionsController < ApplicationController
      def create
        @user = User.find_by_email(params[:email])

        if @user&.authenticate(params[:password])
          render_auth_hash(@user)
        else
          render json: {message: "Invalid Email/Password"}, status: :unauthorized
        end
      end
    end
  end
end