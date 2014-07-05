class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :site
      t.string :email
      t.string :phone
      t.boolean :email_on
      t.boolean :sms_on
      t.text :email_template
      t.text :sms_template
      t.datetime :last_sent
      t.integer :sent_in_row

      t.timestamps
    end
  end
end
