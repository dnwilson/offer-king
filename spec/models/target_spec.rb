require 'rails_helper'

RSpec.describe Target, type: :model do
  let(:target) { build(:target) }

  describe "#min_age" do
    let(:target) { build(:target, min_age: min_age) }

    before { target.valid? }

    context "when less than 13" do
      let(:min_age) { rand(1..12) }
      
      it { expect(target.errors[:min_age]).to include("must be greater than or equal to 13") }
    end
  end

  describe "#max_age" do
    let(:target) { build(:target, max_age: max_age) }

    before { target.valid? }

    context "when less than 13" do
      let(:max_age) { rand(1..12) }
      
      it { expect(target.errors[:max_age]).to include("must be greater than or equal to 13") }
    end
  end

  describe "#genders" do
    let(:target) { build(:target, genders: genders) }
    
    context "when not a valid list" do
      before { target.valid? }
      
      let(:genders) { %w(foo bar) }
      
      it { expect(target.errors[:genders]).to include("contains unrecognized genders") }
    end
    
    context "when list is valid" do
      before { target.valid? }
      
      let(:genders) { 'male' }
      
      it { expect(target.errors[:genders]).not_to include("contains unrecognized genders") }
    end
  end
end
