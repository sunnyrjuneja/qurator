require 'spec_helper'

feature 'Managing decks' do
  scenario "can create a deck" do
    visit '/'

    click_link 'New Deck'

    fill_in 'Name', with: 'Read Later'
    click_button 'Create Deck'

    expect(page).to have_content('Deck has been created.')
  end
end
