Rails.application.routes.draw do



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "home#home"

  get "/message", to: "home#message"

  # =========================================================================
  # Users controller

  get "/users/new", to: "users#sign_up"

  post "/users", to: "users#create"

  get "/signOut", to: "sessions#destroy"

  get "/users/login", to: "sessions#login"

  post "/users/login", to: "sessions#create"

  get "/users/forgotPassword", to: "users#forgot_password"


  get "/profile", to: "profile#profile"

  get "/profile/requests", to: "profile#follow_requests"

  get "/profile/activity", to: "profile#activity"

  put "/profile/editProfile", to: "profile#edit_profile_image"

  get "/profile/edit", to: "profile#edit_profile"

  get "/search", to: "home#search"

end
