Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :pims do
    member do
      put "like", to: "pims#upvote"
    end
  end
  root "pims#index"
end
