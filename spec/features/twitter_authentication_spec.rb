require 'spec_helper'

feature "Twitter Authentication" do
  before do
    OmniAuth.config.mock_auth[:twitter] = {
      :provider => "twitter",
      :uid => "123456",
      :info => { :nickname => "johnqpublic",
        :name => "John Q Public",
        :location => "Anytown, USA",
        :image => "http://si0.twimg.com/sticky/default_profile_images/default_profile_2_normal.png",
        :description => "a very normal guy.",
        :urls => {
          :Website => nil,
          :Twitter => "https://twitter.com/johnqpublic"
        }
      },
      :credentials => {
       :token => "a1b2c3d4", 
        :secret => "abcdef1234"
      }
    }
  end

  scenario "signing in with Twitter" do
    visit "/"
    click_link "Sign in with Twitter"
    page.should have_content("Signed as John Q Public (@johnqpublic)")
  end
end
