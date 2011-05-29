class TweetsController < ApplicationController
  def create
    unless activated?
      redirect_to root_path
      return
    end

    tweet = Tweet.new(params[:tweet])
    response = $twitter.update(tweet.message)

    tweet.save

    redirect_to root_path
  end
end
