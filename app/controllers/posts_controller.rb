class PostsController < ApplicationController
  def new
    @post = Post.new
    @authors = Author.new


    # 今回は分かりやすく、authorは固定で3枠作成
    # 1postで最大3author追加出来る
 
    # 3.times {
    #     # 関連オブジェクトをbuild
    #     @post.authors.build
    # }
  end
 
  def create
    @post = Post.new(post_params)
    @post.save

    logger.debug "--------------#{params[:author][:name]}-------------------"
    @authors = params[:author][:name].split(",")
    @authors.each do |i|
      @author = Author.new(name: i)
      @author.save
      @author_post = AuthorPost.new(post_id: @post.id, author_id: @author.id)
      @author_post.save
    end

    redirect_to posts_new_path
  end
   
  # strong parameters
  private
    def post_params
        params.require(:post).permit(:title, authors_attributes: [:name])
    end

end