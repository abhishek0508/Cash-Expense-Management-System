class ChnageColumnAcoountName < ActiveRecord::Migration[5.2]
  def change
    rename_column :accounts, :name, :accname
  end
end
