require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build(:user) }

  describe "#first_name" do
    let(:user) { build(:user, first_name: first_name) }

    before { user.valid? }

    context "when nil" do
      let(:first_name) {  }
      it { expect(user.errors[:first_name]).to include("can't be blank") }
    end

    context "when more than 30 characters" do
      let(:first_name) { Faker::Lorem.characters(number: 31) }
      it { expect(user.errors[:first_name]).to include("is too long (maximum is 30 characters)") }
    end
  end

  describe "#last_name" do
    let(:user) { build(:user, last_name: last_name) }

    before { user.valid? }

    context "when nil" do
      let(:last_name) {  }
      it { expect(user.errors[:last_name]).to include("can't be blank") }
    end

    context "when more than 30 characters" do
      let(:last_name) { Faker::Lorem.characters(number: 31) }
      it { expect(user.errors[:last_name]).to include("is too long (maximum is 30 characters)") }
    end
  end

  describe "#email" do
    let(:user) { build(:user, email: email) }

    before { user.valid? }

    context "when nil" do
      let(:email) {  }
      it { expect(user.errors[:email]).to include("can't be blank") }
    end

    context "when NOT formatted correctly" do
      let(:email) { "email@.com" }
      it { expect(user.errors[:email]).to include("is invalid") }
    end

    context "when more than 255 characters" do
      let(:email) { "#{Faker::Lorem.characters(number: 250)}@test.com" }
      it { expect(user.errors[:email]).to include("is too long (maximum is 255 characters)") }
    end

    context "when duplicated" do
      let(:other_user) { create(:user) }
      let(:email) { other_user.email }
      it { expect(user.errors[:email]).to include("has already been taken") }
    end
  end

  describe "#birthdate" do
    let(:user) { build(:user, birthdate: birthdate) }

    before { user.valid? }

    context "when nil" do
      let(:birthdate) {  }
      it { expect(user.errors[:birthdate]).to include("is not a valid date") }
    end

    context "when less than 13 years ago" do
      let(:birthdate) { 12.years.ago }
      it { expect(user.errors[:birthdate]).to include("must be at least 13 years old") }
    end
  end

  describe "#age" do
    let(:user) { build(:user, birthdate: birthdate) }
    
    context "when birthday is today" do
      let(:birthdate) { 18.years.ago }

      it { expect(user.age).to eq(18) }
    end
    
    context "when birthday is before today" do
      let(:birthdate) { 18.years.ago - 1.day }

      it { expect(user.age).to eq(17) }
    end

    context "when birthday is after today" do
      let(:birthdate) { 18.years.ago + 1.day }

      it { expect(user.age).to eq(18) }
    end
  end
end
