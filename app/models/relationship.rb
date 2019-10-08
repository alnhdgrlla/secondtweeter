class Relationship < ApplicationRecord
  belongs_to :follower, class_name: 'User', foreign_key: 'follower_id'
  belongs_to :followee, class_name: 'User', foreign_key: 'followee_id'

  validates :follower, presence: true
  validates :followee, presence: true
end
