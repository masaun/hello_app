class CreateAuthorPosts < ActiveRecord::Migration
  def change
    create_table :author_posts do |t|

      t.timestamps null: false
    end
  end
end
