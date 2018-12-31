class AddAmountToTransactions < ActiveRecord::Migration[5.2]
  def change
    add_column :transactions, :amount, :integer
  end
end
