class AddImageToCommission < ActiveRecord::Migration[5.1]
  def change
    add_column :commissions, :image, :string
  end
end
