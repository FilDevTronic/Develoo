class RemoveUserStoryIdFromOrderItems < ActiveRecord::Migration[5.1]
  def change
    remove_column :order_items, :user_story_id, :bigint
  end
end
