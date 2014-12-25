class AddPlainSiteToProject < ActiveRecord::Migration
  def change
    add_column :projects, :plain_site, :string
  end
end
