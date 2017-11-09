class AddAttachmentsToProfile < ActiveRecord::Migration[5.1]
  def change
    add_column :profiles, :attachments, :json
  end
end
