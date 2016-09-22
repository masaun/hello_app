class AddAuthorIdToAuthorPosts < ActiveRecord::Migration
  def change
    add_column :author_posts, :author_id, :integer
  end
end
