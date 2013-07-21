require 'spec_helper'

feature 'Deleting cards' do
  let!(:deck) { FactoryGirl.create(:deck) }
  let!(:card) { FactoryGirl.create(:card, deck: deck) }

  before do
    visit "/"
    click_link deck.name
    click_link card.title
  end

  scenario "Deleting a card" do
    click_link "Delete Card"

    expect(page).to have_content("Card has been deleted.")
    expect(page.current_url).to eq(deck_url(deck))
  end
end
