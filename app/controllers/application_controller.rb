class ApplicationController < ActionController::Base
    before_action :set_current_user

    def set_current_user
        @current_user = User.find_by(id: session[:user_id])
        if @current_user.nil?
            session[:user_id] = nil
        end
    end

    def authenticate_user
        unless @current_user
            flash[:notice] = "ログインが必要です"
            redirect_to("/")
        end
    end

    def forbid_login_user
        if @current_user
            flash[:notice] = "すでにログインしています"
            redirect_to("/")
        end
    end

    def does_exist_user
        unless User.find_by(id: params[:id])
            flash[:notice] = "そのアカウントは存在しません"
            redirect_to("/")
        end
    end
end
