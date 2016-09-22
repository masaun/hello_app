class PostsController < ApplicationController
  def new
    @post = Post.new
 
    # 今回は分かりやすく、authorは固定で3枠作成
    # 1postで最大3author追加出来る
 
    3.times {
        # 関連オブジェクトをbuild
        @post.authors.build
    }
end
 
def create
    @post = Post.new(post_params);
    @post.save
    redirect_to posts_new_path
end
 
# strong parameters
private
  def post_params
      params.require(:post).permit(:title, authors_attributes: [:name])
  end
end