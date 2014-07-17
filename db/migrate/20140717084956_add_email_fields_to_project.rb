class AddEmailFieldsToProject < ActiveRecord::Migration
  def change
    add_column :projects, :email_sender_email, :string
    add_column :projects, :email_sender, :string
    add_column :projects, :email_subject, :string
  end
end
