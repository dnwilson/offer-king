module Api
  module V1
    class OffersController < ApplicationController
      def index
        @offers = Offer.for_user(current_user)

        render json: OfferSerializer.render(@offers), status: :ok
      end
    end
  end
end