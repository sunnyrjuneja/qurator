require 'spec_helper'

feature "Twitter Authentication" do
  before do
    omniauth_twitter
  end

  scenario "signing in with Twitter" do
    visit "/"
    click_link "Sign in with Twitter"
    page.should have_content("Signed as John Q Public (@johnqpublic)")
  end

  scenario "sign out" do
    visit_root_and_sign_in
    click_link "Sign Out"
    page.should have_content("Sign in with Twitter")
    current_path.should eql("/")
  end
end
