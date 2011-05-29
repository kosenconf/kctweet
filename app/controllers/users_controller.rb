class UsersController < ApplicationController
  def index
    @broadcasters  = User.activated
    @requested     = User.inactivated
    @tweets        = Tweet.all

    @tweet = Tweet.new(:user => current_user) if signed_in?
  end
end
