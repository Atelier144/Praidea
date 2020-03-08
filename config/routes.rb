Rails.application.routes.draw do
  root "home#top"

  get "/auth/twitter/callback", to: "users#twitter"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
