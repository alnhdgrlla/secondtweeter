class RemoveColumnFromTweets < ActiveRecord::Migration[5.2]
  def change
    remove_column :tweets, :content
    remove_column :tweets, :username
  end
end
