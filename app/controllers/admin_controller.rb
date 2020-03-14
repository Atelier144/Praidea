class AdminController < ApplicationController
    def create_stamp
        stamp = PraiseStamp.new(name: params[:name], image: params[:image])
        stamp.save
        redirect_to("/#{Rails.application.credentials.admin[:path]}")
    end
end
