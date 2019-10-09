class TweetsController < ApplicationController
  def index
    @tweet = Tweet.new
    @tweets = Tweet.all.order("created_at DESC")
  end

  def create
    @tweet = current_user.tweets.new(tweet_params)
    # binding.pry
    @tweet.save
    redirect_to tweets_path
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy
    redirect_to tweets_path
  end

  private 
  def tweet_params
    params.require(:tweet).permit(:content)
  end
end

