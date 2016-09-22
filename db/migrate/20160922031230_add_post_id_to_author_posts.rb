class AddPostIdToAuthorPosts < ActiveRecord::Migration
  def change
    add_column :author_posts, :post_id, :integer
  end
end
