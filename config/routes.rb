Rails.application.routes.draw do
  resources :branches

  resources :ideas do
    resources :comments
      member do
        put "like", to: "ideas#upvote"
        put "unlike", to: "ideas#downvote"
        put "liked", to: "ideas#liked"
        get :follow
        get :unfollow
        get :user_ideas
      end
    end

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  get 'tags/:tag', to: 'ideas#index', as: :tag

  #Don't go home all the time
  #authenticated :user do
   # root to: 'ideas#index', as: "authenticated_root"
  #end
  root to: 'static#home'

end
