require 'rails_helper'

RSpec.describe "/api/v1/offers", type: :request do
  describe "GET /index" do
    before { create_list(:offer, 15) }

    it "renders a successful response" do
      get api_v1_offers_url, as: :json
      expect(response).to be_successful
    end

    it "returns an array of offers" do
      get api_v1_offers_url, as: :json
      offers = JSON.parse(response.body)
      expect(offers.size).to eq(15)
    end
  end
end
