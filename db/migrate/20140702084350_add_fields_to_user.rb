class AddFieldsToUser < ActiveRecord::Migration
  def up
    add_column :users, :accepted, :boolean, default: false
    User.update_all(accepted: true)
    add_column :users, :reg_token, :string
    add_index :users, :reg_token, :unique => true
  end

  def down
    remove_column :users, :accepted
    remove_index :users, :reg_token
    remove_column :users, :reg_token
  end
end
