require 'spec_helper'

feature 'Viewing cards' do
  let!(:card) { FactoryGirl.create(:card) }

  before do
    visit_root_and_sign_in
    click_link card.deck.name
  end

  scenario "Viewing cards for a given deck" do

    expect(page).to have_content(card.title)

    click_link card.title

    within("h1") do
      expect(page).to have_content(card.title)
    end

    expect(page).to have_content(card.description)
    expect(page).to have_content(card.link)
  end

  scenario "Return to deck" do
    click_link card.title
    click_link "Return to #{card.deck.name}"

    within("h1") do
      expect(page).to have_content(card.deck.name)
    end

    expect(page).to have_content(card.title)
  end
end
