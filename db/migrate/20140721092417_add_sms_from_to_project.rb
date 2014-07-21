class AddSmsFromToProject < ActiveRecord::Migration
  def change
    add_column :projects, :sms_from, :string
  end
end
