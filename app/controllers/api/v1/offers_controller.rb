module Api
  module V1
    class OffersController < ApplicationController
      def index
        @offers = Offer.all

        render json: OfferSerializer.render(@offers), status: :ok
      end
    end
  end
end