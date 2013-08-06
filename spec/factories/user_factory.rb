FactoryGirl.define do
  factory :user do
    provider "twitter"
    uid      123456
    nickname "johnqpublic"
    name     "John Q Public"
    token    "a1b2c3d4"
    secret   "abcdef1234"
    image    "http://si0.twimg.com/sticky/default_profile_images/default_profile_2_normal.png"
  end
end
