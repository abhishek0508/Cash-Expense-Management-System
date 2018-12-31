class AddImageToTransactions < ActiveRecord::Migration[5.2]
  def change
    add_column :transactions, :image, :bytea
  end
end
