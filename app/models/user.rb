class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :tweets, dependent: :destroy

  has_many :active_relationship, class_name: 'Relationship', foreign_key: follower_id
  has_many :followees, through: :active_relationship

  has_many :passive_relationship, class_name: 'Relationship', foreign_key: followee_id
  has_many :followers, through: :passive_relationship
end
