class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :text
      t.integer :project_id
      t.string :type

      t.timestamps
    end
  end
end
