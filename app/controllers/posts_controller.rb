class PostsController < ApplicationController
  def create
    @post = Post.new(params.require(:post).permit(:content,:card_id))
    if @post.save
      flash[:notice] = "新規投稿"
      redirect_to :cards
    else
      render "posts"
    end
  end


end
