class AddColumnToRelationship < ActiveRecord::Migration[5.2]
  def change
    add_column :relationships, :followee_id, :string
    add_column :relationships, :follower_id, :string
  end
end
