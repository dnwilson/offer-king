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

  describe "#for_user" do
    let(:user) { create(:user) }
    let!(:offer) do
      target = build(:target, min_age: 13, max_age: user.age, genders: [user.gender])
      create(:offer, targets: [target])
    end
    let!(:gender_match_offer) do
      target = build(:target, min_age: 13, max_age: user.age - 3, genders: [user.gender])
      create(:offer, targets: [target])
    end
    let!(:age_matching_offer) do
      target = build(:target, min_age: 13, max_age: user.age, genders: (User.genders.values - [user.gender]))
      create(:offer, targets: [target])
    end
    let(:for_user) { described_class.for_user(user) }

    context "when offer matches on gender and age" do
      it { expect(for_user).to include(offer) }
    end

    context "when offer only matches gender" do
      it { expect(for_user).not_to include(gender_match_offer) }
    end

    context "when offer only matches age" do
      it { expect(for_user).not_to include(age_matching_offer) }
    end
  end
end
