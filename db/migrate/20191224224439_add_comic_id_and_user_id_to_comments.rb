class AddComicIdAndUserIdToComments < ActiveRecord::Migration[6.0]
  def change
    add_column :comments, :user_id, :integer 
    add_column :comments, :comic_id, :integer 
  end
end
