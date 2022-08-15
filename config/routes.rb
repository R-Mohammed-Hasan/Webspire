# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root "home#home"

  get "/message", to: "messages#show"

  get "/message/:id", to: "messages#message"

  put "/message/new/:id", to: "messages#create"

  get "/signOut", to: "sessions#destroy"

  post "/users", to: "users#create"

  get "/users/new", to: "users#sign_up"

  get "/users/login", to: "sessions#login"

  post "/users/login", to: "sessions#create"

  get "signUp/create", to: "users#google_sign_up", as: :create_google_sign_up

  get "login", to: "sessions#google_login"

  get "login/create", to: "sessions#google_login_create", as: :create_login

  get "/users/forgotPassword", to: "users#forgot_password"

  post "/users/forgotPassword", to: "users#send_mail"

  get "/users/resetPassword", to: "users#reset_password"

  post "/users/resetPassword", to: "users#update_password"

  get "/profile/request/:id", to: "profile#request_following"

  get "/profile/requests", to: "profile#follow_requests"

  get "/profile/activity", to: "profile#activity"

  put "/profile/editProfile", to: "profile#edit_profile_image"

  get "/profile/edit", to: "profile#new_edit"

  post "/profile/edit", to: "profile#edit_profile"

  put "/profile/story", to: "profile#story_create"

  get "/profile/stories", to: "profile#story", as: "story"

  delete "/story/delete/:id", to: "profile#delete_story"

  get "/profile/:id", to: "profile#profile"

  get "/profile/unfollow/:id", to: "profile#unfollow"

  post "/post/create", to: "posts#post_create"

  get "/post/:id", to: "posts#show"

  get "/post/delete/:id", to: "posts#destroy"

  put "/post/like/:post_id", to: "posts#like"

  put "/post/dislike/:post_id", to: "posts#dislike"

  get "/post/edit/:id", to: "posts#edit"

  post "/post/edit/:post_id", to: "posts#edit"

  get "/search", to: "home#search"

  get "/searching", to: "home#searching"

  get "/activity/requests", to: "activities#requests"

  get "/activity/accept/:id", to: "activities#accept"

  get "/activity/reject/:id", to: "activities#reject"

  put "/comment/:post_id", to: "posts#create_comment"

  put "/comment/delete/:comment_id", to: "posts#delete_comment"
end
