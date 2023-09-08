module Api
  module V1
    class UserOffersController < ApplicationController
      before_action :set_offer, only: :create

      def create
        user_offer = @offer.user_offers.new(user: current_user)

        if user_offer.save
          serializer = OfferSerializer.render(
            @offer.reload, view: :user_offer, user_offer: user_offer
          )
          render json: serializer, status: :created
        else
          errors = user_offer.errors.full_messages.join(". ")
          render json: { error: errors }, status: :unprocessable_entity
        end
      end

      def destroy
        if current_user.user_offers.find(params[:id]).destroy
          render json: {}, status: :ok
        else
          render json: { error: "Unable to remove offer" }, status: :unprocessable_entity
        end
      end

      private

      def set_offer
        @offer = Offer.for_user(current_user).find(params[:offer_id])
      end
    end
  end
end