class AddBitrixAssignedUserIdToProject < ActiveRecord::Migration
  def change
    add_column :projects, :bitrix_assigned_id, :integer
  end
end
