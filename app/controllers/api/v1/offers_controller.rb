module Api
  module V1
    class OffersController < ApplicationController
      before_action :set_offers

      def index
        render json: OfferSerializer.render(@offers, user: current_user), status: :ok
      end

      # def claim
      #   @offer = @offers.find(params[:id])
      #   @user_offer = @offer.user_offers.create(user: current_user)

      #   if @user_offer.valid?
      #     render json: OfferSerializer.render(@offer, user: current_user), status: :created
      #   else
      #     errors = @user_offer.errors.full_messages.join(". ")
      #     render json: { error: errors }, status: :unprocessable_entity
      #   end
      # end

      private

      def set_offers
        @offers = Offer.for_user(current_user)
      end
    end
  end
end