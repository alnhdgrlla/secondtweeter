class Types::UserType < Types::BaseObject
  field :id, ID, null: false
  field :username, String, null: true
  field :bio, String, null: true
  field :email, String, null: true
  field :created_at, Types:: DateTimeType, null: false
  field :updated_at, Types::DateTimeType, null: false
  field :total_following, Integer, null: true
  field :total_follower, Integer, null: true
  field :total_tweet, Integer, null: true
  field :followees, [Types::UserType], null: true
  field :followers, [Types::UserType], null: true
  field :tweets, [Types::TweetType], null: true
  field :feed, [Types::TweetType], null: true



  # def tweet_count
  #   object.total_tweet
  # end

  # def total_following
  #   object.total_following /2
  # end
end
