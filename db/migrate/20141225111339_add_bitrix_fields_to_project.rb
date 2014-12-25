class AddBitrixFieldsToProject < ActiveRecord::Migration
  def change
    add_column :projects, :bitrix_on, :boolean
    add_column :projects, :bitrix_url, :string
    add_column :projects, :bitrix_login, :string
    add_column :projects, :bitrix_password, :string
    add_column :projects, :bitrix_title_template, :string
    add_column :projects, :bitrix_comment_template, :string
    add_column :projects, :bitrix_params_template, :string
  end
end