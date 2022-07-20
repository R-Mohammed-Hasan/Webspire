Rails.application.routes.draw do



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "home#home"

  get "/message", to: "home#message"

  put "/message/new", to: "home#new_message"

  get "/signOut", to: "sessions#destroy"


  post "/users", to: "users#create"

  get "/users/new", to: "users#sign_up"

  get "/users/login", to: "sessions#login"

  post "/users/login", to: "sessions#create"

  get "/users/forgotPassword", to: "users#forgot_password"


  get "/profile/requests", to: "profile#follow_requests"

  get "/profile/activity", to: "profile#activity"

  put "/profile/editProfile", to: "profile#edit_profile_image"

  get "/profile/edit", to: "profile#new_edit"

  post "/profile/edit", to: "profile#edit_profile"

  put "/profile/story", to: "profile#story_create"

  get "/profile/stories", to: "profile#story", as: "story"

  get "/profile/:id", to: "profile#profile"

  get "/profile/request/:id", to: "profile#request_following"


  post "/post/create", to: "posts#post_create"

  get "/post/:id", to: "posts#show"

  get "/post/delete/:id", to: "posts#destroy"

  put "/post/like/:post_id", to: "posts#like"

  put "/post/dislike/:post_id", to: "posts#dislike"

  get "/post/edit/:id", to: "posts#edit"

  get "/search", to: "home#search"


  get "/activity/requests", to: "activities#requests"

  get "/activity/accept/:id", to: "activities#accept"

  get "/activity/reject/:id", to: "activities#reject"

  put "/comment/:post_id", to: "posts#comment"

  post "/post/edit/:post_id", to: "posts#edit"

# ====================================================================

  get "/api/v1/posts", to: "posts#posts_api"
post "/api/v1/posts", to: "posts#new_post_api"



end
