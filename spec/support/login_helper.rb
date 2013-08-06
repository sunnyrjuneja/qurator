module LoginHelper
  def omniauth_twitter
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

  def visit_root_and_sign_in
    omniauth_twitter
    visit "/"
    click_link "Sign in with Twitter"
  end
end
