class ChangeColumNameAccount < ActiveRecord::Migration[5.2]
  def change
    rename_column :accounts, :account_name, :name
  end
end
