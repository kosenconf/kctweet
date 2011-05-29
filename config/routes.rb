Kctweet::Application.routes.draw do
  post "/tweets", :to => "tweets#create"

  get "/auth/:provider/callback" => "sessions#callback"
  get "/signout" => "sessions#destroy", :as => :signout

  root :to => "users#index"
end
