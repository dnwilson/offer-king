require 'rails_helper'

RSpec.describe Offer, type: :model do
  describe "#description" do
    let(:offer) { build(:offer, description: description) }

    before { offer.valid? }

    context "when nil" do
      let(:description) {  }
      it { expect(offer.errors[:description]).to include("can't be blank") }
    end

    context "when more than 255 characters" do
      let(:description) { "#{Faker::Lorem.characters(number: 256)}" }
      it { expect(offer.errors[:description]).to include("is too long (maximum is 255 characters)") }
    end

    context "when duplicated" do
      let(:other_offer) { create(:offer) }
      let(:description) { other_offer.description }
      it { expect(offer.errors[:description]).to include("has already been taken") }
    end
  end
end
