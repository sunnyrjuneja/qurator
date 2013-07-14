require 'spec_helper'

feature 'Managing decks' do
  before do
    visit '/'
    click_link 'New Deck'
  end

  scenario "can create a deck" do
    fill_in 'Name', with: 'Read Later'
    click_button 'Create Deck'

    expect(page).to have_content('Deck has been created.')
  end

  scenario "can not create a deck without a name" do
    click_button 'Create Deck'

    expect(page).to have_content("Deck has not been created.")
    expect(page).to have_content("Name can't be blank")
  end
end
