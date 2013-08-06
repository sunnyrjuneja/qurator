require 'spec_helper'

describe Deck do
  let(:user) { FactoryGirl.create(:user) }
  let(:deck) { FactoryGirl.create(:deck, user: user) }

  subject { deck }

  it { should be_valid }

  it { should respond_to(:name) }
  it { should respond_to(:user_id) }

  describe "validations" do

    describe "when user_id is not present" do
      before { deck.user_id = nil }
      it { should_not be_valid }
    end

    describe "should fail with no name" do
      before { deck.name = " "}
      it { should_not be_valid }
    end

    describe "should not be longer than 50 characters" do
      before { deck.name = "a" * 51 }
      it { should_not be_valid }
    end
  end

  describe "card associations" do
    before do 
      deck.save 
      FactoryGirl.create(:card, deck: deck, user: user)
    end

    it "should destroy associated cards after deletion" do
      cards = deck.cards.to_a
      deck.destroy
      expect(cards).not_to be_empty
      cards.each do |card|
        expect(Card.where(id: card.id)).to be_empty
      end
    end
  end
end
