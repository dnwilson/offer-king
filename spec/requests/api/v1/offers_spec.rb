require 'rails_helper'

RSpec.describe "/api/v1/offers", type: :request do
  let(:user) { create(:user) }
  let(:visit_path) { get api_v1_offers_url, as: :json }

  describe "GET /index" do
    before { create_list(:offer, 15, :for_user, user: user) }

    context "when user is authenticated" do
      before do
        login_as(user)
        visit_path
      end

      it "renders a successful response" do
        expect(response).to be_successful
      end
  
      it "returns an array of offers" do
        offers = JSON.parse(response.body)
        expect(offers.size).to eq(15)
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
