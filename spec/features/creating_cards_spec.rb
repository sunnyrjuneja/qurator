require 'spec_helper'

feature "Creating Cards" do
  before do
    FactoryGirl.create(:deck, name: "Watch Later")

    visit '/'

    click_link "Watch Later"
    click_link "New Card"
  end

  scenario 'Creating a card' do
    fill_in "Title", with: "Charlie and the Chocolate Factory"
    fill_in "Description", with: "Deranged pedophile big-business industrialist tortures and mutilates young children."
    fill_in "Link", with: "http://www.flixster.com/movie/charlie-and-the-chocolate-factory/"

    click_button "Create Card"

    expect(page).to have_content("Card has been created.")
  end

  scenario 'Creating a card without valid attributes fails' do
    click_button "Create Card"

    expect(page).to have_content("Card has not been created.")
    expect(page).to have_content("Title and Link can't both be blank.")
  end
end
