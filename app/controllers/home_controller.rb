class HomeController < ApplicationController
  def top
  end

  def terms
  end

  def privacy
  end

  def admin
    if @current_user
      if @current_user.uid != Rails.application.credentials.admin[:uid].to_s
        redirect_to("/")
      end
    else
      redirect_to("/")
    end
  end
end
