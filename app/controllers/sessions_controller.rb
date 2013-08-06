class SessionsController < ApplicationController
  def create
    auth = env["omniauth.auth"]
    @user = User.where(auth.slice("provider", "uid")).first
    if @user.nil?
      @user = User.new(provider: auth[:provider], uid: auth[:uid], 
                       nickname: auth[:info][:nickname], name: auth[:info][:name], 
                       token: auth[:credentials][:token], secret: auth[:credentials][:secret],
                       image: auth[:info][:image])
      @user.save
    end
    flash[:notice] = "Signed as #{@user.name} (@#{@user.nickname})"
    sign_in @user
    redirect_to decks_path
  end

  def destroy
    sign_out
    redirect_to root_url
  end
end
