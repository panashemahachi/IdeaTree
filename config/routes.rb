Rails.application.routes.draw do
  resources :ideas do
      member do
        put "like", to: "ideas#upvote"
      end
    end


  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  root to: 'static#home'

  get 'tags/:tag', to: 'ideas#index', as: :tag

end
