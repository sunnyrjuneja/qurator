require 'spec_helper'

feature 'Viewing decks' do
  scenario "Listing all decks" do
    deck = FactoryGirl.create(:deck)

    visit '/'
    click_link 'Example Deck'
    expect(page.current_url).to eql(deck_url(deck))
  end
end

