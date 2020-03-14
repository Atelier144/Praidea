class UsersController < ApplicationController
  def show
    @user = User.find_by(id: params[:id])
    @posts = Post.where(user_id: params[:id]).order(created_at: :desc)
    @praise_stamps = PraiseStamp.all
    @board_user_id = params[:id]
  end

  def profile_form

  end

  def profile_update

  end

  def profile_done

  end

  def icon_form

  end

  def icon_update

  end

  def icon_destroy

  end

  def icon_done

  end

  def logout
    session[:user_id] = nil
    redirect_to("/")
  end

  def twitter
    auth_hash = request.env["omniauth.auth"]
    @provider = auth_hash[:provider]
    @uid = auth_hash[:uid]
    @name = auth_hash[:info][:name]
    @image = auth_hash[:info][:image]
    @description = auth_hash[:info][:description]
    @url = auth_hash[:info][:urls][:Website]
    @twitter_url = auth_hash[:info][:urls][:Twitter]
  end

  def twitter_post
    if params[:provider] == "twitter"
      user = User.find_by(uid: params[:uid])
      if user
        session[:user_id] = user.id
        redirect_to("/")
      else
        new_user = User.new(
          uid: params[:uid],
          name: params[:name],
          image: params[:image],
          description: params[:description],
          url: params[:url],
          twitter_url: params[:twitter_url]
        )
        if new_user.save
          session[:user_id] = User.find_by(uid: params[:uid]).id 
          redirect_to("/")
        else
          flash[:notice] = "Twitterでの新規登録に失敗しました"
          redirect_to("/")
        end
      end
    else
      flash[:notice] = "Twitter認証に失敗しました"
      redirect_to("/")
    end
  end
end
