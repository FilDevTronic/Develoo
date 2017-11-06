class CreateUserStories < ActiveRecord::Migration[5.1]
  def change
    create_table :user_stories do |t|
      t.string :as_a
      t.string :isbat
      t.string :so_that
      t.references :commission, foreign_key: true

      t.timestamps
    end
  end
end
