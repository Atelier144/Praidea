Rails.application.routes.draw do
  root "home#top"
  get "/terms", to: "home#terms"
  get "/privacy", to: "home#privacy"

  get "/auth/twitter/callback", to: "users#twitter"
  get "/auth/failure", to: "users#twitter_failure"
  post "/twitter", to: "users#twitter_post"
  
  post "/logout", to: "users#logout"

  get "/posts", to: "posts#show"
  post "/posts/create", to:"posts#create"

  post "/praise/create/:post_id/:stamp_id/:idea_id/:board_user_id", to: "praises#create"
  post "/praise/destroy/:post_id/:stamp_id/:idea_id/:board_user_id", to: "praises#destroy"

  get "/users/:id", to: "users#show"

  get "/settings/profile", to: "users#profile_form"
  get "/settings/profile-icon", to: "users#profile_icon_form"
  get "/settings/resign", to: "users#resign_form"

  post "/settings/profile", to: "users#profile_update"
  post "/settings/profile-icon", to: "users#profile_icon_update"
  post "/settings/profile-icon/default", to: "users#profile_icon_destroy"
  post "/settings/resign", to: "users#resign"

  get "/settings/profile/done", to: "users#profile_done"
  get "/settings/profile-icon/done", to: "users#profile_icon_done"
  get "/settings/resign/done", to: "users#resign_done"

  get "/#{Rails.application.credentials.admin[:path]}", to: "home#admin"

  post "/admin/create/stamp", to: "admin#create_stamp"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
