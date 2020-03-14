class PraisesController < ApplicationController
    def create
        user_id = @current_user.id
        post_id = params[:post_id]
        stamp_id = params[:stamp_id]
        idea_id = params[:idea_id]
        board_user_id = params[:board_user_id]

        praise = Praise.find_by(user_id: user_id, post_id: post_id, stamp_id: stamp_id)
        unless praise
            new_praise = Praise.new(user_id: user_id, post_id: post_id, stamp_id: stamp_id)
            if new_praise.save
                if board_user_id == "0"
                    redirect_to("/posts#idea-#{idea_id}")
                else
                    redirect_to("/users/#{board_user_id}#idea-#{idea_id}")
                end
            else
                redirect_to("/")
            end
        end
    end

    def destroy
        user_id = @current_user.id
        post_id = params[:post_id]
        stamp_id = params[:stamp_id]
        idea_id = params[:idea_id]
        board_user_id = params[:board_user_id]

        praise = Praise.find_by(user_id: user_id, post_id: post_id, stamp_id: stamp_id)
        if praise
            if praise.destroy
                if board_user_id == "0"
                    redirect_to("/posts#idea-#{idea_id}")
                else
                    redirect_to("/users/#{board_user_id}#idea-#{idea_id}")
                end
            else
                redirect_to("/")
            end
        end
    end
end
