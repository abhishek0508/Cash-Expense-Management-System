class AddIndexToUsersEmail < ActiveRecord::Migration[5.2]
  def change
    add_index :users, :emailId, unique: true
  end
end
