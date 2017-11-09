class AddHiddenToCommission < ActiveRecord::Migration[5.1]
  def change
    add_column :commissions, :hidden, :boolean, default: false
  end
end
