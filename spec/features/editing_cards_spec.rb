require 'spec_helper'

feature 'Editing cards' do
  let!(:deck) { FactoryGirl.create(:deck) }
  let!(:card) { FactoryGirl.create(:card, deck: deck) }

  before do
    visit "/"
    click_link deck.name
    click_link card.title
    click_link "Edit Card"
  end

  scenario 'Updating a card' do
    fill_in "Title", with: "Cards are awesome!"
    click_button "Update Card"

    expect(page).to have_content("Card has been updated.")

    within("#card h2") do
      expect(page). to have_content("Cards are awesome!")
    end

    expect(page).to_not have_content card.title
  end
  
  scenario 'Updating a card with invalid information' do
    fill_in "Title", with: ""
    fill_in "Link", with: ""
    click_button "Update Card"

    expect(page).to have_content("Card has not been updated.")
  end
end
