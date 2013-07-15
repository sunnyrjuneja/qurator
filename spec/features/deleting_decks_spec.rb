require 'spec_helper'

feature 'Deleting decks' do
  scenario "Deleting a deck" do
    FactoryGirl.create(:deck)

    visit  '/'
    click_link 'Example Deck'
    click_link 'Delete Deck'

    expect(page).to have_content('Deck has been destroyed.')

    visit '/'

    expect(page).to have_no_content('Example Deck')
  end
end
