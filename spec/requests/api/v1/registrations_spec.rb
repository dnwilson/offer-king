require 'rails_helper'


RSpec.describe "Registrations", type: :request do
  describe "POST sign_up" do
    let(:sign_up) { post "/api/v1/sign-up", params: valid_attributes }

    context "with valid params" do
      let(:valid_attributes) do
        {
          registration: {
            first_name: "Annette", last_name: "Morgan", gender: "female",
            email: "annette@example.com", birthdate: "1971-09-18", password: "passwerk",
            password_confirmation: "passwerk"
          }
        }
      end
      
      before { sign_up }

      it { expect(User.count).to eq(1) }
      it { expect(response).to be_successful }
    end

    context "with invalid params" do
      let(:valid_attributes) { { registration: { email: "someguy@test.com", password: "passwerk" } } }
      
      before { sign_up }

      it { expect(response).not_to be_successful }
    end
  end
end
