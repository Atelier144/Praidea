class UsersController < ApplicationController
  before_action :does_exist_user, only:[:show]

  before_action :authenticate_user, only:[
    :profile_form, :profile_update, :profile_done,
    :profile_icon_form, :profile_icon_update, :profile_icon_destroy, :profile_icon_done,
    :resign_form, :resign
  ]

  protect_from_forgery except: :twitter_post

  def show
    @user = User.find_by(id: params[:id])
    @posts = Post.where(user_id: params[:id]).order(created_at: :desc)
    @praise_stamps = PraiseStamp.all
    @board_user_id = params[:id]
  end

  def profile_form

  end

  def profile_update
    user = @current_user
    name = params[:name]
    description = params[:description]
    url = params[:url]

    is_genuine = "true"

    if name == ""
      is_genuine = nil
      flash[:name_warning] = "ユーザー名を入力してください"
    else
      flash[:name] = name
    end

    if description.length > 300
      is_genuine = nil
      flash[:description_warning] = "300字以内で記述してください"
    else
      flash[:description] = description
    end

    if url.length > 200
      is_genuine = nil
      flash[:url_warning] = "URLが長すぎます。本当にURLですか？"
    else
      flash[:url] = url
    end

    if is_genuine
      user.name = name
      user.description = description
      user.url = url

      if user.save
        redirect_to("/settings/profile/done")
      else
        flash[:notice] = "プロフィールの更新に失敗しました"
        redirect_to("/settings/profile")
      end
    else
      redirect_to("/settings/profile")
    end

  end

  def profile_done

  end

  def profile_icon_form

  end

  def profile_icon_update
    user = @current_user
    image = params[:image]
    if image.present?
      user.raw_image = image
      if user.save
        user.image = user.raw_image.url
        if user.save
          redirect_to("/settings/profile-icon/done")
        else
          flash[:notice] = "画像ファイルのアップロードに失敗しました。"
          redirect_to("/settings/profile-icon")
        end
      else
        flash[:notice] = "画像ファイルのアップロードに失敗しました。"
        redirect_to("/settings/profile-icon")
      end
    end
  end

  def profile_icon_destroy
    user = @current_user

  end

  def profile_icon_done

  end

  def resign_form

  end

  def resign
    user = @current_user

    posts = Post.where(user_id: user.id)
    praises = Praise.where(user_id: user.id)

    user.destroy
    posts.each do |post|
      praiseds = Praise.where(post_id: post.id)
      praiseds.each do |praised|
        praised.destroy
      end
      post.destroy
    end

    praises.each do |praise|
      praise.destroy
    end

    session[:user_id] = nil

    redirect_to("/settings/resign/done")
  end

  def resign_done

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

  def twitter_failure
    redirect_to("/")
  end
end
