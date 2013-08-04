require 'spec_helper'

feature 'Viewing cards' do
  before do
    @deck = FactoryGirl.create(:deck,  name: "Watch Later")
    @card = FactoryGirl.create(:card, deck: @deck)    
    read_later = FactoryGirl.create(:deck,  name: "Read Later")
    FactoryGirl.create(:card, deck: read_later, title: "Moby Dick")
    visit "/"
  end

  scenario "Viewing cards for a given deck" do
    click_link @deck.name

    expect(page).to have_content(@card.title)

    expect(page).to_not have_content("Moby Dick")

    click_link @card.title

    within("h1") do
      expect(page).to have_content(@card.title)
    end

    expect(page).to have_content(@card.description)
    expect(page).to have_content(@card.link)
  end
end
