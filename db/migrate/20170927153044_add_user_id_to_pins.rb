class AddUserIdToPins < ActiveRecord::Migration[5.1]
  def change
    add_column :pims, :user_id, :integer
    add_index :pims, :user_id
  end
end
