require 'spec_helper'

feature 'Viewing cards' do
  let!(:card) { FactoryGirl.create(:card) }

  before do
    visit_root_and_sign_in
  end

  scenario "Viewing cards for a given deck" do
    click_link card.deck.name

    expect(page).to have_content(card.title)

    click_link card.title

    within("h1") do
      expect(page).to have_content(card.title)
    end

    expect(page).to have_content(card.description)
    expect(page).to have_content(card.link)
  end
end
