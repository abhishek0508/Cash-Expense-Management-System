class AddDescriptionToTransactions < ActiveRecord::Migration[5.2]
  def change
    add_column :transactions, :description, :string
  end
end
