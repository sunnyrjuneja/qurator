require 'spec_helper'

feature 'Viewing decks' do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:deck) { FactoryGirl.create(:deck, user: user) }

  scenario "Listing all decks" do
    visit_root_and_sign_in
    click_link deck.name
    expect(page.current_url).to eql(deck_url(deck))
  end
end

