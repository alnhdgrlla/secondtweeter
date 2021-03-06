class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :email, presence: true, uniqueness: true
  # validates :username, presence: true

  # has_secure_password

  has_many :tweets, dependent: :destroy
  has_one :tweet_count, dependent: :destroy

  has_many :active_relationships, class_name: 'Relationship', foreign_key: 'follower_id'
  has_many :followees, through: :active_relationships

  has_many :passive_relationships, class_name: 'Relationship', foreign_key: 'followee_id'
  has_many :followers, through: :passive_relationships


  def following?(user)
    self.followees.include?(user)
  end

  def follow(user)
    active_relationships.create!(followee_id: user.id) if !self.following?(user) && self != user
  end
  
  def unfollow(user)
    active_relationships.find_by(followee_id: user).destroy unless self.following?(user) && self == user
  end
  
  def feed
    Tweet.where(user_id: id).or(Tweet.where(user_id: active_relationships.select(:followee_id)))
  end

  def total_tweet
    Tweet.where(user_id: id).count
  end

  def total_following
    Relationship.where(follower_id: id).count
  end

  def total_follower
    Relationship.where(followee_id: id).count
  end
end



