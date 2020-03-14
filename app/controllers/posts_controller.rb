class PostsController < ApplicationController
  def show
    @posts = Post.all.order(created_at: :desc)
    @praise_stamps = PraiseStamp.all
    @board_user_id = 0
  end

  def create
    post = Post.new(user_id: @current_user.id, content: params[:content], image: params[:image])
    post.save
    redirect_to("/posts")
  end
end
