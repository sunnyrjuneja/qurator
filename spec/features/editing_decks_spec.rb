require 'spec_helper'

feature "Editing Decks" do
  let!(:deck) { FactoryGirl.create(:deck) }

  before do
    visit_root_and_sign_in
    click_link deck.name
    click_link "Edit Deck"
  end

  scenario 'Updating a deck' do
    fill_in "Name", with: "Sample Deck"
    click_button "Update Deck"
    
    expect(page).to have_content("Deck has been updated.")
  end

  scenario 'Updating a deck with invalid attributes' do
    fill_in "Name", with: ""
    click_button "Update Deck"

    expect(page).to have_content("Deck has not been updated.")
  end
end
