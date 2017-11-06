class UpdateForeignKey < ActiveRecord::Migration[5.1]
  def change
    # remove the old foreign_key
    remove_foreign_key :user_stories, :commissions

    # add the new foreign_key
    add_foreign_key :user_stories, :commissions, on_delete: :cascade
  end
end
