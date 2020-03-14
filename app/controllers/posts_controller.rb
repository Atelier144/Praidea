class PostsController < ApplicationController
  def show
    @posts = Post.all.order(created_at: :desc)
    @praise_stamps = PraiseStamp.all
    @board_user_id = 0
  end

  def create
    user = @current_user
    content = params[:content]
    image = params[:image]

    is_genuine = "true"

    if content == ""
      is_genuine = nil
      flash[:content_warning] = "入力してください"
    elsif content.length > 260
      is_genuine = nil
      flash[:content_warning] = "260字以内で記述してください"
      flash[:content] = content
    else
      flash[:content] = content
    end

    if is_genuine
      post = Post.new(user_id: user.id, content: content, image: image)
      if post.save
        flash[:content_warning] = nil
        flash[:content] = nil
        redirect_to("/posts")
      else
        flash[:notice] = "投稿に失敗しました"
        redirect_to("/posts")
      end
    else
      redirect_to("/posts")
    end
  end
end
