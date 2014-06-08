class AddIndexToPosts < ActiveRecord::Migration
  def change
    add_index :posts, :user_id
    add_index :posts, :comment_id
  end
end
