require 'spec_helper'

describe Deck do
  before do
    @deck = FactoryGirl.create(:deck)
  end

  describe "card associations" do
    before do 
      @deck.save 
      FactoryGirl.create(:card, deck: @deck)
    end

    it "should destroy associated cards after deletion" do
      cards = @deck.cards.to_a
      @deck.destroy
      expect(cards).not_to be_empty
      cards.each do |card|
        expect(Card.where(id: card.id)).to be_empty
      end
    end
  end
end
