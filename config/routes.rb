Rails.application.routes.draw do



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html



  root "home#home"



  get "/activity", to: "profile#activity"



  get "/editProfile", to: "profile#edit_profile"



  get "/users/new", to: "users#sign_up"



  get "/followRequests", to: "profile#follow_requests"



  get "/profile", to: "profile#profile"



  get "/message", to: "home#message"



  # get "message", to: "message#index"



end

