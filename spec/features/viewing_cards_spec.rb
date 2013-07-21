require 'spec_helper'

feature 'Viewing cards' do
  before do
    watch_later = FactoryGirl.create(:deck,  name: "Watch Later")

    FactoryGirl.create(:card, deck: watch_later, title: "Wizard of Oz.",
                       description: "Transported to a surreal landscape, a young"\
                       " girl kills the first person she meets and then teams up"\
                       " with three strangers to kill again.",
                       link: "http://www.amazon.com/gp/product/B002QRCBW0")

    read_later = FactoryGirl.create(:deck,  name: "Read Later")

    FactoryGirl.create(:card, deck: read_later,
                       title: "Moby Dick")

    visit "/"
  end

  scenario "Viewing cards for a given deck" do
    click_link "Watch Later"

    expect(page).to have_content("Wizard of Oz")
    expect(page).to_not have_content("Moby Dick")

    click_link "Wizard of Oz"

    within("#card h2") do
      expect(page).to have_content("Wizard of Oz")
    end

    expect(page).to have_content("Transported to a surreal landscape, a young"\
                       " girl kills the first person she meets and then teams up"\
                       " with three strangers to kill again.")
  end
end
