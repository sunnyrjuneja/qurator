require 'spec_helper'

feature 'Deleting cards' do
  let!(:card) { FactoryGirl.create(:card) }

  before do
    visit_root_and_sign_in
    click_link card.deck.name
    click_link card.title
  end

  scenario "Deleting a card" do
    click_link "Delete Card"

    expect(page).to have_content("Card has been deleted.")
    expect(page.current_url).to eq(deck_url(card.deck))
  end
end
