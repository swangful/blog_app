class AddPostIdCommentIDandMicropostIdToUser < ActiveRecord::Migration
  def change
    add_column :users, :post_id, :integer
    add_column :users, :comment_id, :integer
    add_column :users, :micropost_id, :integer
  end
end
