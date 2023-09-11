module Api
  module V1
    class RegistrationsController < ApplicationController
      def create
        @user = User.new(registration_params)

        if @user.save
          render_auth_hash(@user)
        else
          render json: {message: "Invalid Email/Password"}, status: :unauthorized
        end
      end

      private

      def registration_params
        params
          .require(:registration)
          .permit(:first_name, :last_name, :email, :gender, 
                  :birthdate, :password, :password_confirmation)
      end
    end
  end
end