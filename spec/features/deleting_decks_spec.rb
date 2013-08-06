require 'spec_helper'

feature 'Deleting decks' do
  let!(:deck) { FactoryGirl.create(:deck) }

  before do
    visit_root_and_sign_in
  end

  scenario "Deleting a deck" do
    click_link deck.name
    click_link 'Delete Deck'

    expect(page).to have_content('Deck has been destroyed.')

    visit decks_path

    expect(page).to have_no_content('Example Deck')
  end
end
