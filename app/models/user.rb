class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :tweets, dependent: :destroy

  has_many :active_relationships, class_name: 'Relationship', foreign_key: 'follower_id'
  has_many :followees, through: :active_relationships

  has_many :passive_relationships, class_name: 'Relationship', foreign_key: 'followee_id'
  has_many :followers, through: :passive_relationships

  def following?(user)
    self.followees.include?(user)
  end

  def follow(user)
    followees << user
  end
  
  def unfollow(user)
    active_relationships.find_by(user.id).destroy
  end
  
end



