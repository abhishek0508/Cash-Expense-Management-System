class AddAttachmentImageToTransactions < ActiveRecord::Migration[5.2]
  def self.up
    change_table :transactions do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :transactions, :image
  end
end
