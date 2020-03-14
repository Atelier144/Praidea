Rails.application.routes.draw do
  root "home#top"
  get "/terms", to: "home#terms"
  get "/privacy", to: "home#privacy"

  get "/auth/twitter/callback", to: "users#twitter"
  post "/twitter", to: "users#twitter_post"
  post "/logout", to: "users#logout"

  get "/posts", to: "posts#show"
  post "/posts/create", to:"posts#create"

  post "/praise/create/:post_id/:stamp_id/:idea_id/:board_user_id", to: "praises#create"
  post "/praise/destroy/:post_id/:stamp_id/:idea_id/:board_user_id", to: "praises#destroy"

  get "/users/:id", to: "users#show"

  get "/settings/profile", to: "users#profile_form"
  get "/settings/icon", to: "users#icon_form"

  get "/#{Rails.application.credentials.admin[:path]}", to: "home#admin"

  post "/admin/create/stamp", to: "admin#create_stamp"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
