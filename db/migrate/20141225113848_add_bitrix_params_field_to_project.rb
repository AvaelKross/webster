class AddBitrixParamsFieldToProject < ActiveRecord::Migration
  def change
    add_column :projects, :bitrix_params_template, :string
  end
end
