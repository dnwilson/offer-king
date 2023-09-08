require 'rails_helper'

RSpec.describe "/api/v1/offers", type: :request do
  let(:user) { create(:user) }

  describe "POST /offers/:order_id" do
    let(:offer) { create(:offer, :for_user, user: user) }
    let(:visit_path) { post api_v1_offer_user_offers_url(offer), as: :json }

    context "when user is authenticated" do
      before { login_as(user) }

      it "returns original offer" do
        visit_path
        json = JSON.parse(response.body)
        expect(json["claimed"]).to eq(true)
      end
    end

    context "when user NOT authenticated" do
      it "returns an error message" do
        visit_path
        error = JSON.parse(response.body)["error"]
        expect(error).to eq("You are not authorized to view this resource")
      end
    end
  end

  describe "DELETE /:id" do
    let(:offer) { create(:offer, :for_user, user: user) }
    let(:user_offer) { create(:user_offer, offer: offer, user: user) }
    let(:visit_path) { delete api_v1_user_offer_url(user_offer.offer), as: :json }

    context "when user is authenticated" do
      before { login_as(user) }

      it "removes the user offer" do
        visit_path
        json = JSON.parse(response.body)
        expect(json["claimed"]).to eq(false)
      end
    end

    context "when user NOT authenticated" do
      it "returns an error message" do
        visit_path
        error = JSON.parse(response.body)["error"]
        expect(error).to eq("You are not authorized to view this resource")
      end
    end
  end
end
