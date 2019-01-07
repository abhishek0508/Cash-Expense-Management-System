class AddApproveToTransaction < ActiveRecord::Migration[5.2]
  def change
    add_column :transactions, :approve, :boolean, default: false
  end
end
