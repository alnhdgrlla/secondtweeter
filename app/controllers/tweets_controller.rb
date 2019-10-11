class TweetsController < ApplicationController
  def index
    @tweet = Tweet.new
    # @tweets = current_user.feed.order("created_at DESC").limit(10).offset(@tweets*5)
    @tweets = current_user.feed.order("created_at DESC").paginate(page: params[:page], per_page: 5)
  end

  def create
    @tweet = current_user.tweets.new(tweet_params)
    # binding.pry
    @tweet.save
    redirect_to tweets_path
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    if current_user == @tweet.user
      @tweet.destroy
    end
    redirect_to tweets_path
  end

  private 
  def tweet_params
    params.require(:tweet).permit(:content)
  end
end

