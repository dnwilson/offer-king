require 'rails_helper'


RSpec.describe "Sessions", type: :request do
  let(:valid_attributes) {}
  let(:invalid_attributes) {}

  describe "POST login" do
    let(:login) { post "/api/v1/login", params: valid_attributes }

    context "with valid params" do
      let(:user) { create(:user, password: "passwerk", password_confirmation: "passwerk") }
      let(:valid_attributes) { { email: user.email, password: "passwerk" } }
      before { login }
      it { expect(response).to be_successful }
    end

    context "with invalid params" do
      let(:valid_attributes) { { email: "someguy@test.com", password: "passwerk" } }
      
      before { login }

      it { expect(response).not_to be_successful }
      it { expect(JSON.parse(response.body)["message"]).to eq("Invalid Email/Password") }
    end
  end
end
