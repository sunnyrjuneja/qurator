require 'spec_helper'

describe Card do
  let(:card) { FactoryGirl.build(:card) }

  subject { card }

  it { should respond_to(:title) }
  it { should respond_to(:description) }
  it { should respond_to(:link) }

  describe "validations" do
    describe "when deck_id is not present" do
      before { card.deck_id = nil }
      it { should_not be_valid }
    end

    describe "when user_id is not present" do
      before { card.user_id = nil }
      it { should_not be_valid }
    end

    describe "it should fail with no title or link" do
      before do
        card.title = " "
        card.link = " "
      end
      it { should_not be_valid }
    end
  end

  describe "ensures link has protocol" do
    before do 
      card.link = "www.qurator.com" 
      card.save
    end

    its(:link) { should eq "http://www.qurator.com" }
  end
end
