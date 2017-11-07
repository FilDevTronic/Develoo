class RemoveCommissionIdFromUserStories < ActiveRecord::Migration[5.1]
  def change
    remove_column :user_stories, :commission_id, :bigint
  end
end
